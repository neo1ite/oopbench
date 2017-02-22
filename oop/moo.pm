# Use Moo to implement a class.

package oop::moo;
use common::sense;
use workload;

use Moo;
use namespace::autoclean;

has name   => (is => 'ro', isa => sub { die "$_[0] is not a string!" unless (!ref($_[0]) && $_[0] =~ /\w+/); });
has result => (is => 'rw', isa => sub { die "$_[0] is not an array ref!" unless (ref($_[0]) eq 'ARRAY'); });

sub run {
    my $self = shift;
    $self->result(workload->run());
}

sub run_arg1 {
    my ($self, $arg1) = @_;
    $self->result(workload->run_arg1($arg1));
}

__PACKAGE__->meta->make_immutable;
