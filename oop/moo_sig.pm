# Use Moo to implement a class and Method::Signatures to implement methods.

package oop::moo_sig;
use common::sense;
use workload;

use Moo;
use Method::Signatures;
use namespace::autoclean;

has name   => (is => 'ro', isa => sub { die "$_[0] is not a string!" unless (!ref($_[0]) && $_[0] =~ /\w+/); });
has result => (is => 'rw', isa => sub { die "$_[0] is not an array ref!" unless (ref($_[0]) eq 'ARRAY'); });

method run {
    $self->result(workload->run());
}

method run_arg1($arg1) {
    $self->result(workload->run_arg1($arg1));
}

__PACKAGE__->meta->make_immutable;
