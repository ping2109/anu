#!/bin/bash

cd /tmp/rom

com ()
{
    tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1
}

time com out 1
