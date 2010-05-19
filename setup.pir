#!/usr/bin/env parrot
# $Id$

=head1 NAME

setup.pir - Python distutils style

=head1 DESCRIPTION

No Configure step, no Makefile generated.

=head1 USAGE

    $ parrot setup.pir build
    $ parrot setup.pir test
    $ sudo parrot setup.pir install

=cut

.sub 'main' :main
    .param pmc args
    $S0 = shift args
    load_bytecode 'distutils.pbc'

    $P0 = new 'Hash'
    $P0['name'] = 'pir'
    $P0['abstract'] = 'the pir compiler'
    $P0['description'] = 'the pir for Parrot VM.'

    # build
    $P1 = new 'Hash'
    $P1['src/Compiler/Actions.pir'] = 'src/Compiler/Actions.pm'
    $P1['src/Compiler/Grammar.pir'] = 'src/Compiler/Grammar.pm'
    $P1['src/Compiler.pir']         = 'src/Compiler.pm'
    $P0['pir_nqprx'] = $P1

    $P3 = new 'Hash'
    $P3['pir.pbc'] = 'pir.pir'
    $P0['pbc_pir'] = $P3

    $P7 = new 'Hash'
    $P7['parrot-pir'] = 'pir.pbc'
    $P0['installable_pbc'] = $P7

    # Test
    $S0 = get_parrot()
    $S0 .= ' pir.pbc'
    $P0['prove_exec'] = $S0


    .tailcall setup(args :flat, $P0 :flat :named)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

