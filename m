Return-path: <andrea.merello@gmail.com>
MIME-Version: 1.0
Reply-To: andrea.merello@gmail.com
In-Reply-To: <4d369a94-2497-1404-70be-660fe13c7788@roeck-us.net>
References: <1473251617-4107-1-git-send-email-andrea.merello@gmail.com>
 <20160907131651.GA18441@Red> <0b99d601-20a9-acaf-bf21-a2ea92061564@roeck-us.net>
 <CAN8YU5OAR4RyyK-qvVVXV_bSjEkj9bLRSxUF98ZSLdOxkZr=Vw@mail.gmail.com>
 <99597c50-c73e-26ea-1690-6ab323e8c87a@roeck-us.net> <CAN8YU5O+mn53PnfbjKUderXXzPiVBAtiFRe8-wTzQypDkjwwmA@mail.gmail.com>
 <4d369a94-2497-1404-70be-660fe13c7788@roeck-us.net>
From: Andrea Merello <andrea.merello@gmail.com>
Date: Thu, 8 Sep 2016 16:38:30 +0200
Message-ID: <CAN8YU5PVrn04Bw5u5ndsCuJzGhC1Z1q=aGRMG7LpWqtoqTCv3w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: new driver for ST stts751 thermal sensor
To: Guenter Roeck <linux@roeck-us.net>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Sep 8, 2016 at 3:35 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 09/08/2016 12:42 AM, Andrea Merello wrote:
>>
>>
> [ ... ]
>
>>
>>         Will look if I can find another driver with similar issue to sno=
op at..
>>
>>     Try lm90.c:lm90_read16().
>>
>>
>>
>> I see.. This is reasonable, and I will implement this trick in stts751 d=
river.. This seems to have good chances to read correctly, but it can still=
 go racy for example if the converter ends a conversion between the first t=
wo reads, and we get preempted in between the last two reads (so that the H=
W ends another conversion). IMHO looking _also_  at time, and eventually re=
try, makes things even more robust..
>>
> As a general comment, please use a mailer which splits lines at 80 column=
s or less.

Thanks for pointing this out. (Probably I just need to remember to
switch gmail in plain text mode..)

>
>
> While I understand your concern, the time check is complete overkill.
> What is the probability for a double bad reading, and on top of that one =
that
> includes a change in the high temperature register ? One in a Million ?
> With a downside of a wrong fraction in the "error" case ? And what does t=
hat
> really mean, on a chip with a specified accuracy of +/- 1 degrees C ?

Yes, I see your point, and this is indeed true. Probably I have been
too paranoid on this...

> Even your solution to drop the fraction in some cases doesn't really solv=
e anything.
> It now reports, say, 30.0 degrees C instead of 30.875 degrees C. How is t=
hat better
> than a "wrong" 30.X degrees C, where X is any other value it might report=
 ?

You're right, I could let the "wrong" fraction data. (but the point of
my solution was not this indeed).

>> I'd say we could add time check and retry (with proper cpu_relax() to av=
oid those hot loops) also to lm90 rather than removing it from stts651  :)
>>
> Only if you can show that the problem is seen in the real world.
>
>
>>
>>
>>
>>
>>                     +                       break;
>>                     +
>>                     +               /* if we are going on with a racy re=
ad, don't pretend to be
>>                     +                * super-precise, just use the MSBs =
..
>>                     +                */
>>                     +               frac =3D 0;
>>                     +       }
>>                     +
>>                     +exit:
>>                     +       mutex_unlock(&priv->access_lock);
>>                     +       if (ret)
>>                     +               return ret;
>>                     +
>>                     +       /* use integer2, because when we fallback to=
 the "MSB-only" compromise
>>                     +        * this is the more recent one
>>                     +        */
>>                     +       priv->temp =3D stts751_to_deg(integer2, frac=
);
>>
>>
>>             All other drivers I am aware of manage to handle conversions=
 from 16 bit chip
>>             values to temperatures and from temperatures to chip values =
with a single parameter.
>>
>>
>>         I'll check this.. BTW This chip wants two separated reads from t=
wo registers, one for the integer and one for the fractional part. The purp=
ose of this function is interpreting these two raw HW values to convert in =
a number. Is this so bad ?
>>
>>     Again, have a look at lm90.c:lm90_read16() and the conversion functi=
ons
>>     in drivers which have to read two registers to read the temperature.
>>
>>     Is it bad ? It makes the code more complicated than it has to be and
>>     increases code size, so, yes, I consider it bad.
>>
>>
>> It does not look like that the simple register combination that lm90 doe=
s could also work for the integer/fractional format of the stts751.
>>
> Why ? The register formats are exactly the same.

Aah, I didn't saw temp_from_s16() in lm90.c that does the conversion
afterwards, thus I assumed the data read from lm90 didn't need any
conversion and that the reg format was different.. sorry.. Now I got
what you meant :)

>> I'll check again more carefully to see if for some math trick the two th=
ings eventually end up to produce the same result, but right now it seems t=
o me that we need to do some math over the two read values in stts751. And =
the same for the reverse direction conversion.
>>
>> If the point above turns out to be true, then I honestly can't see how d=
ividing the two-registers read (with its trick to avoid races) and the math=
 calculations in two functions, as it is now,  could make things appearing =
so complicated. Honestly I would say the opposite :) .. However if it's bet=
ter for you, I can merge the two things in one single function..
>>
> Two vs. one function isn't the question here. The lm90 driver combines th=
e two register
> values into a single variable. Using a single variable is what I asked fo=
r.

OK, I'll do the lm90 way :)

>>
>>
>>     To some degree I understand your concerns, but complex problems don'=
t
>>     always mean that there has to be a complex solution. Unless you have=
 a good
>>     reason for the complexity, please keep the driver as simple as possi=
ble.
>>     That not only reduces code size, it also reduces the probability to
>>     introduce bugs, and it reduces amount of time we have to spend revie=
wing
>>     the code.
>>
>>
>> In general that's absolutely true :) But IMHO here we have neither compl=
icated or simple solutions; we just have a certain degree of probability to=
 do a (slightly) wrong read (in lm90 also), and we can put less or more eff=
ort (code) in trying to reduce this probability.
>>
>> If you feel that what lm90 does is enough, and that is the "standard" wa=
y, I'll do the same.. Although I still would prefer to be more paranoid abo=
ut races..
>>
> I would say it is sufficient. Many sensors have the same problem, and it =
would
> really be up to the chip vendors to define better (ie 16 bit) register se=
ts.
> Until then, we have to find a trade-off between code complexity and avoid=
ing
> races like this.

I see..

Thank you very much for discussion and explanations :)

Andrea

>>
>> BTW I will come back with a V2 as per your requirements, but unfortunate=
ly it will not happen very soon ;(
>>
> No problem.
>
> Guenter
>
