Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:53693 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966651AbeEYLlo (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 May 2018 07:41:44 -0400
In-Reply-To: <1525688738-9185-3-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
To: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
        linux@roeck-us.net
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Cc: linux-hwmon@vger.kernel.org, stewart@linux.vnet.ibm.com,
        jdelvare@suse.com, linux-kernel@vger.kernel.org, paulus@samba.org,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [2/3] hwmon: (ibmpowernv): Add support to read 64 bit sensors
Message-Id: <40skqV3WZFz9s1b@ozlabs.org>
Date: Fri, 25 May 2018 21:41:42 +1000 (AEST)
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, 2018-05-07 at 10:25:37 UTC, Shilpasri G Bhat wrote:
> The firmware has supported for reading sensor values of size u32.
> This patch adds support to use newer firmware functions which allows
> to read the sensors of size u64.
> 
> Signed-off-by: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/3c8c049aa7bdffaab2e53401fd5270

cheers
