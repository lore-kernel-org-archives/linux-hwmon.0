Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-it1-f193.google.com ([209.85.166.193]:35873 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728821AbeJLCgI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Oct 2018 22:36:08 -0400
Received: by mail-it1-f193.google.com with SMTP id c85-v6so14865458itd.1
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Oct 2018 12:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20181007204949.19628-1-linus.walleij@linaro.org> <3b6774e6-dab1-0adc-69b6-225b9b9a275b@suse.de>
In-Reply-To: <3b6774e6-dab1-0adc-69b6-225b9b9a275b@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Oct 2018 21:07:23 +0200
Message-ID: <CACRpkdYOJD_3TEOKExcm7_W9tj6rAbvxe8Md1SME_s3JtVuBzg@mail.gmail.com>
Subject: Re: [PATCH v5] scsi: Add hwmon support for SMART temperature sensors
To: Hannes Reinecke <hare@suse.de>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-scsi@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-hwmon@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Oct 8, 2018 at 8:09 AM Hannes Reinecke <hare@suse.de> wrote:
> On 10/7/18 10:49 PM, Linus Walleij wrote:

> Hmm. I might be getting something wrong here, but the main problem with
> SMART values is that they are _not_ really standardized; plus any drive
> is free to implement whatever they want.

Yes so for ATA drives specifically we probe for attribute 194 which
is what most ATA drives use. All I tried atleast, both rotating and
SSD.

The move to SCSI in order to make it easy to add in support for
also say SAS, SCSI, NVME, USB was requested by James.

What you say makes me feel you want me to move it back to libata?

> Plus there are tons of SMART attribute values, and decoding just one
> seems to be a bit poor. At the same time having them in the kernel will
> just require us to implement lots of decoding, which I really would
> leave to userland.

I don't see any reason whatsoever to implement parsing of any
other SMART attributes than temperature. I think it is wise to
keep the rest of the SMART policy in userspace. But temperature
is different, and a special case. It is just a sensor in the harddrive,
but also only exposed to the system like this.

As explained, it is not an either/or approach for this specific
attribute, userspace can still read it too. If it wants to. But in fact
after reading the smartmontools daemon config file, it comes
out that many daemons are configured to ignore the temperature
attribute "because it changes too fast". It is kind of a bad fit
for the drive diagnostics really, it is better off as a temperature
zone in the kernel.

As explained in the commit message, I need this to be able to
bind the thermal driver to the temperature sensor in the harddrive
of a specific NAS. The NAS does not provide any other temperature
sensor and we cannot even rely on this one to be there, but when
it is, it should be presented to the kernel, so we can apply a policy
for it, to drive the fan off and on.

The NAS in question is an ARM system which does not have any
BIOS to define temperature zones. It needs this to this by
defining them explicitly and bind to the sensor(s).

Yours,
Linus Walleij
