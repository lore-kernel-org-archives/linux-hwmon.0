Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from vps-vb.mhejs.net ([37.28.154.113]:38095 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751461AbdGWUNw (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Jul 2017 16:13:52 -0400
Subject: Re: [PATCH] hwmon: (it87) Reapply probe path chip registers settings
 after resume
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <363dba2e-c228-4b85-897c-e74eb33aed90@maciej.szmigiero.name>
 <981118b8-3d58-b529-861e-aabaacf1d4bc@roeck-us.net>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Message-ID: <3e6af6d7-948f-95f4-7009-92213326b234@maciej.szmigiero.name>
Date: Sun, 23 Jul 2017 22:13:49 +0200
MIME-Version: 1.0
In-Reply-To: <981118b8-3d58-b529-861e-aabaacf1d4bc@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 23.07.2017 22:01, Guenter Roeck wrote:
> On 07/23/2017 09:12 AM, Maciej S. Szmigiero wrote:
>> After a suspend / resume cycle we possibly need to reapply chip registers
>> settings that we had set or fixed in a probe path, since they might have
>> been reset to default values or set incorrectly by a BIOS again.
>>
>> Tested on a Gigabyte M720-US3 board, which requires routing internal VCCH5V
>> to in7 (and had it wrong again on resume from S3).
>>
>> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> 
> I understand the problem, but this looks quite invasive. Can this be solved
> without changing the driver all over the place ?

We need to keep track of Super I/O base address (sioaddr), since we need to
write to IT87_SIO_PINX2_REG register in a resume path.
This register is only writable via a GPIO interface so we can't change it
via Environmental Controller I/O port (that this driver normally uses).

The rest is basically making various internal state initializations in
it87_init_device() conditional on 'resume' parameter, so they don't execute
on resume and also about two dozen lines of actual resume handler.

This patch shouldn't cause any change of behavior in probe path.

> 
> Guenter

Maciej
