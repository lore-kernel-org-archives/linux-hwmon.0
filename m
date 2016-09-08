Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53887 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934527AbcIHNgC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Sep 2016 09:36:02 -0400
Subject: Re: [PATCH 1/2] hwmon: new driver for ST stts751 thermal sensor
To: andrea.merello@gmail.com
References: <1473251617-4107-1-git-send-email-andrea.merello@gmail.com>
 <20160907131651.GA18441@Red>
 <0b99d601-20a9-acaf-bf21-a2ea92061564@roeck-us.net>
 <CAN8YU5OAR4RyyK-qvVVXV_bSjEkj9bLRSxUF98ZSLdOxkZr=Vw@mail.gmail.com>
 <99597c50-c73e-26ea-1690-6ab323e8c87a@roeck-us.net>
 <CAN8YU5O+mn53PnfbjKUderXXzPiVBAtiFRe8-wTzQypDkjwwmA@mail.gmail.com>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <4d369a94-2497-1404-70be-660fe13c7788@roeck-us.net>
Date: Thu, 8 Sep 2016 06:35:59 -0700
MIME-Version: 1.0
In-Reply-To: <CAN8YU5O+mn53PnfbjKUderXXzPiVBAtiFRe8-wTzQypDkjwwmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/08/2016 12:42 AM, Andrea Merello wrote:
>
[ ... ]

>
>         Will look if I can find another driver with similar issue to snoop at..
>
>     Try lm90.c:lm90_read16().
>
>
>
> I see.. This is reasonable, and I will implement this trick in stts751 driver.. This seems to have good chances to read correctly, but it can still go racy for example if the converter ends a conversion between the first two reads, and we get preempted in between the last two reads (so that the HW ends another conversion). IMHO looking _also_  at time, and eventually retry, makes things even more robust..
>
As a general comment, please use a mailer which splits lines at 80 columns or less.

While I understand your concern, the time check is complete overkill.
What is the probability for a double bad reading, and on top of that one that
includes a change in the high temperature register ? One in a Million ?
With a downside of a wrong fraction in the "error" case ? And what does that
really mean, on a chip with a specified accuracy of +/- 1 degrees C ?

Even your solution to drop the fraction in some cases doesn't really solve anything.
It now reports, say, 30.0 degrees C instead of 30.875 degrees C. How is that better
than a "wrong" 30.X degrees C, where X is any other value it might report ?

> I'd say we could add time check and retry (with proper cpu_relax() to avoid those hot loops) also to lm90 rather than removing it from stts651  :)
>
Only if you can show that the problem is seen in the real world.

>
>
>
>
>                     +                       break;
>                     +
>                     +               /* if we are going on with a racy read, don't pretend to be
>                     +                * super-precise, just use the MSBs ..
>                     +                */
>                     +               frac = 0;
>                     +       }
>                     +
>                     +exit:
>                     +       mutex_unlock(&priv->access_lock);
>                     +       if (ret)
>                     +               return ret;
>                     +
>                     +       /* use integer2, because when we fallback to the "MSB-only" compromise
>                     +        * this is the more recent one
>                     +        */
>                     +       priv->temp = stts751_to_deg(integer2, frac);
>
>
>             All other drivers I am aware of manage to handle conversions from 16 bit chip
>             values to temperatures and from temperatures to chip values with a single parameter.
>
>
>         I'll check this.. BTW This chip wants two separated reads from two registers, one for the integer and one for the fractional part. The purpose of this function is interpreting these two raw HW values to convert in a number. Is this so bad ?
>
>     Again, have a look at lm90.c:lm90_read16() and the conversion functions
>     in drivers which have to read two registers to read the temperature.
>
>     Is it bad ? It makes the code more complicated than it has to be and
>     increases code size, so, yes, I consider it bad.
>
>
> It does not look like that the simple register combination that lm90 does could also work for the integer/fractional format of the stts751.
>
Why ? The register formats are exactly the same.

> I'll check again more carefully to see if for some math trick the two things eventually end up to produce the same result, but right now it seems to me that we need to do some math over the two read values in stts751. And the same for the reverse direction conversion.
>
> If the point above turns out to be true, then I honestly can't see how dividing the two-registers read (with its trick to avoid races) and the math calculations in two functions, as it is now,  could make things appearing so complicated. Honestly I would say the opposite :) .. However if it's better for you, I can merge the two things in one single function..
>
Two vs. one function isn't the question here. The lm90 driver combines the two register
values into a single variable. Using a single variable is what I asked for.

>
>
>     To some degree I understand your concerns, but complex problems don't
>     always mean that there has to be a complex solution. Unless you have a good
>     reason for the complexity, please keep the driver as simple as possible.
>     That not only reduces code size, it also reduces the probability to
>     introduce bugs, and it reduces amount of time we have to spend reviewing
>     the code.
>
>
> In general that's absolutely true :) But IMHO here we have neither complicated or simple solutions; we just have a certain degree of probability to do a (slightly) wrong read (in lm90 also), and we can put less or more effort (code) in trying to reduce this probability.
>
> If you feel that what lm90 does is enough, and that is the "standard" way, I'll do the same.. Although I still would prefer to be more paranoid about races..
>
I would say it is sufficient. Many sensors have the same problem, and it would
really be up to the chip vendors to define better (ie 16 bit) register sets.
Until then, we have to find a trade-off between code complexity and avoiding
races like this.

>
> BTW I will come back with a V2 as per your requirements, but unfortunately it will not happen very soon ;(
>
No problem.

Guenter

