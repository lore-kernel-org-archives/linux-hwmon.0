Return-Path: <linus.walleij@linaro.org>
Return-path: <linus.walleij@linaro.org>
MIME-Version: 1.0
References: <20180809222425.17304-1-linus.walleij@linaro.org>
 <eef62afc-76bd-c9a5-6b12-6ba40b7eca66@roeck-us.net> <cf319e6a-59a9-d6de-79e2-91994177194c@roeck-us.net>
In-Reply-To: <cf319e6a-59a9-d6de-79e2-91994177194c@roeck-us.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Aug 2018 23:03:03 +0200
Message-ID: <CACRpkdYZnqTeCQSeVq38b_pVmJNpSN+P4xnU0Jr4v=WAQ6tBfw@mail.gmail.com>
Subject: Re: [PATCH] RFC: libata: Add hwmon support for SMART temperature sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Tejun Heo <tj@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Jean Delvare <jdelvare@suse.com>, linux-ide@vger.kernel.org, linux-hwmon@vger.kernel.org,
	smartmontools-support@listi.jpberlin.de
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Aug 13, 2018 at 12:31 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 08/09/2018 09:15 PM, Guenter Roeck wrote:
> > On 08/09/2018 03:24 PM, Linus Walleij wrote:

> >> +        if (id == SMART_TEMP_PROP_194)
> >> +            break;
>
> 231 also seems to report the temperature if available, as does 190.

They have the same temperature format(s) but AFAICT these
have specific meanings:
smartmontools has a drive database that tells the story.

190 is the Air flow temperature
231 reports temperature on some drives but on others this is the
   "SSD life left"

To avoid erroneous interpretation I kept with just 194.

> Not sure if 190 is worth it, though - Samsung SSD 840 PRO Series supports
> it but reports a static value of 28. And it seems to be either as
> degrees C or as 100 - degrees C, depending on the drive manufacturer,
> which makes it quite unreliable.

I guess we could add more heuristics if we want. Maybe not
as the first step.

Yours,
Linus Walleij
