#!perl -wT
use warnings;
use strict;
use Test::More;

eval "use Pod::Coverage 0.19";
plan skip_all => 'Pod::Coverage 0.19 required' if $@;

eval "use Test::Pod::Coverage 1.04";
plan skip_all => 'Test::Pod::Coverage 1.04 required' if $@;

plan skip_all => 'set TEST_POD to enable this test'
  unless ($ENV{TEST_POD} || -e 'MANIFEST.SKIP');

# skip deprecated methods
all_pod_coverage_ok({ trustme => [qr/^(?:
      update_location
    | downtime_schedule
    | friends
    | following
    | followers
    | following_timeline
    | friends_timeline
    | legacy_\w+
    | trends
)$/x]});
