Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:53703 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966646AbeEYLln (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 May 2018 07:41:43 -0400
In-Reply-To: <1525688738-9185-2-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
To: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
        linux@roeck-us.net
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Cc: linux-hwmon@vger.kernel.org, stewart@linux.vnet.ibm.com,
        jdelvare@suse.com, linux-kernel@vger.kernel.org, paulus@samba.org,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [1/3] powernv: opal-sensor: Add support to read 64bit sensor values
Message-Id: <40skqT5t84z9s4k@ozlabs.org>
Date: Fri, 25 May 2018 21:41:41 +1000 (AEST)
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, 2018-05-07 at 10:25:36 UTC, Shilpasri G Bhat wrote:
> This patch adds support to read 64-bit sensor values. This method is
> used to read energy sensors and counters which are of type u64.
> 
> Signed-off-by: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/5cdcb01e0af5a709c9bebe0e0450dc

cheers
