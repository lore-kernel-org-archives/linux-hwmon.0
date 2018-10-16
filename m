Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt1-f195.google.com ([209.85.160.195]:42039 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbeJPQGk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Oct 2018 12:06:40 -0400
Received: by mail-qt1-f195.google.com with SMTP id j46-v6so24660237qtc.9
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Oct 2018 01:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20181007204949.19628-1-linus.walleij@linaro.org> <b2a634c1-233c-48be-564f-92435b0cede5@t-online.de>
In-Reply-To: <b2a634c1-233c-48be-564f-92435b0cede5@t-online.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Oct 2018 10:17:13 +0200
Message-ID: <CACRpkdbwvDmtA2mh-vf_O=sTrEox1O9a8a1jHydzZL5CAK+iKw@mail.gmail.com>
Subject: Re: [smartmontools-support] [PATCH v5] scsi: Add hwmon support for
 SMART temperature sensors
To: Christian.Franke@t-online.de
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Christian,

thanks a lot for your feedback!

On Tue, Oct 16, 2018 at 7:36 AM Christian Franke
<Christian.Franke@t-online.de> wrote:
> Linus Walleij wrote:
> > ...
> > - I am uncertain if this applies to SAS drives as well,
> >    it appears not (Christian Frankes answer) they
> >    require a different access method, and I can't test it,
> >    so I am currently only setting it up explicitly for
> >    ATA slave devices.
>
> It doesn't apply to SAS devices.
>
> If there is ATA/SATA temperature detection support in the kernel, it
> should IMO also be mapped to SCSI/SAS commands as suggested by SAT (see
> also the mail from Douglas Gilbert):
> If SCSI Temperature Log page is requested (SCSI LOG SENSE cmd) for an
> ATA/SATA device, read SMART attributes and return a Log page with
> Temperature field set from attribute 194.
>
> Does your patch support this?

Not yet. I have nothing to test with, else I would try to take a
stab. I try to start by fixing the small need I have but leave space
and placeholders for improvements.

> SAT requires "SCT Status" or "Device Statistics" access method for
> temperature. In practice, SMART attribute 194 is supported by much more
> devices.

If something like this is used by USB attached drives I could try it,
because I do have a USB cradle.

Yours,
Linus Walleij
