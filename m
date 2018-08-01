Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:41333 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733304AbeHAHID (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 1 Aug 2018 03:08:03 -0400
In-Reply-To: <1532423589-18730-2-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
To: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
        linux@roeck-us.net
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Cc: linux-hwmon@vger.kernel.org, ego@linux.vnet.ibm.com,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
        linux-kernel@vger.kernel.org, stewart@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [v8, 1/2] powernv:opal-sensor-groups: Add support to enable sensor groups
Message-Id: <41gMDb4Ry7z9s4V@ozlabs.org>
Date: Wed,  1 Aug 2018 15:24:15 +1000 (AEST)
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, 2018-07-24 at 09:13:08 UTC, Shilpasri G Bhat wrote:
> Adds support to enable/disable a sensor group at runtime. This
> can be used to select the sensor groups that needs to be copied to
> main memory by OCC. Sensor groups like power, temperature, current,
> voltage, frequency, utilization can be enabled/disabled at runtime.
> 
> Signed-off-by: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/04baaf28f40c68c35a413cd9d0db71

cheers
