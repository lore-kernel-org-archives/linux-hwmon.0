Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:59269 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966653AbeEYLlp (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 May 2018 07:41:45 -0400
In-Reply-To: <1525688738-9185-4-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
To: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
        linux@roeck-us.net
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Cc: linux-hwmon@vger.kernel.org, stewart@linux.vnet.ibm.com,
        jdelvare@suse.com, linux-kernel@vger.kernel.org, paulus@samba.org,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [3/3] hwmon: (ibmpowernv) Add energy sensors
Message-Id: <40skqW5Xm4z9s2k@ozlabs.org>
Date: Fri, 25 May 2018 21:41:43 +1000 (AEST)
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, 2018-05-07 at 10:25:38 UTC, Shilpasri G Bhat wrote:
> This patch exports the accumulated power numbers of each power
> sensor maintained by OCC.
> 
> Signed-off-by: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/43d2974b66d916a6df16e536da542e

cheers
