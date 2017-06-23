Return-Path: <venture@google.com>
Return-path: <venture@google.com>
MIME-Version: 1.0
In-Reply-To: <20170623152923.GA10652@roeck-us.net>
References: <20170623150525.7014-1-venture@google.com> <20170623152923.GA10652@roeck-us.net>
From: Patrick Venture <venture@google.com>
Date: Fri, 23 Jun 2017 12:33:47 -0700
Message-ID: <CAO=notw-J0655d6=1Y2cXO_fE_rC3+AwFX8sz27ZJubVRz6adA@mail.gmail.com>
Subject: Re: [PATCH 1/2 v2] hwmon: (aspeed-pwm-tacho) reduce fan_tach period
To: Guenter Roeck <linux@roeck-us.net>
Cc: Emily Shaffer <emilyshaffer@google.com>, Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org,
	peterh@google.com
Content-Type: multipart/alternative; boundary="94eb2c1170e21fa2230552a5ae64"
List-ID: <linux-hwmon@vger.kernel.org>

--94eb2c1170e21fa2230552a5ae64
Content-Type: text/plain; charset="UTF-8"

I changed the commit message. Since you said you never received this patch,
it was prudent to resend it. However, since I had sent it and you said you
didn't receive it, I assumed it was being merged with the previous patch
that had been before using a patch-set was required. So I modified the
commit message so I could bump the version so you'd likely see it this
time; whereas before it was getting clumped with the previous fodder.

I was deliberately trying to be helpful. I didn't know you needed the
history and couldn't just use the latest patch version.

Patrick

On Jun 23, 2017 8:29 AM, "Guenter Roeck" <linux@roeck-us.net> wrote:

> On Fri, Jun 23, 2017 at 08:05:25AM -0700, Patrick Venture wrote:
> > Reduce the fan_tach period such that the fan controller uses a shorter
> > period to measure the rpm.
> >
> > Testing: Tested on an ast2400 sitting on a quanta-q71l.
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
>
> Please provide change logs, and keep version numbers consistent
> for a series even if one patch doesn't change.
>
> Now I'll have to go back, find the flurry of older versions, and try
> to find out what changed and why. This takes time which I don't have.
> I'll probably only get to this after the next commit window, sorry.
>
> Guenter
>
> > ---
> >  drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/aspeed-pwm-tacho.c
> b/drivers/hwmon/aspeed-pwm-tacho.c
> > index 86e2ea8287a7..b2ab5612d8a4 100644
> > --- a/drivers/hwmon/aspeed-pwm-tacho.c
> > +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> > @@ -160,7 +160,7 @@
> >   * 11: reserved.
> >   */
> >  #define M_TACH_MODE 0x02 /* 10b */
> > -#define M_TACH_UNIT 0x1000
> > +#define M_TACH_UNIT 0x00c0
> >  #define INIT_FAN_CTRL 0xFF
> >
> >  struct aspeed_pwm_tacho_data {
> > --
> > 2.13.1.611.g7e3b11ae1-goog
> >
>

--94eb2c1170e21fa2230552a5ae64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I changed the commit message. Since you said you never re=
ceived this patch, it was prudent to resend it. However, since I had sent i=
t and you said you didn&#39;t receive it, I assumed it was being merged wit=
h the previous patch that had been before using a patch-set was required. S=
o I modified the commit message so I could bump the version so you&#39;d li=
kely see it this time; whereas before it was getting clumped with the previ=
ous fodder.<div dir=3D"auto"><br></div><div dir=3D"auto">I was deliberately=
 trying to be helpful. I didn&#39;t know you needed the history and couldn&=
#39;t just use the latest patch version.</div><div dir=3D"auto"><br><div di=
r=3D"auto">Patrick</div></div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Jun 23, 2017 8:29 AM, &quot;Guenter Roeck&quot; &lt;<=
a href=3D"mailto:linux@roeck-us.net">linux@roeck-us.net</a>&gt; wrote:<br t=
ype=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, Jun 23, 2017 at =
08:05:25AM -0700, Patrick Venture wrote:<br>
&gt; Reduce the fan_tach period such that the fan controller uses a shorter=
<br>
&gt; period to measure the rpm.<br>
&gt;<br>
&gt; Testing: Tested on an ast2400 sitting on a quanta-q71l.<br>
&gt;<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m">venture@google.com</a>&gt;<br>
<br>
Please provide change logs, and keep version numbers consistent<br>
for a series even if one patch doesn&#39;t change.<br>
<br>
Now I&#39;ll have to go back, find the flurry of older versions, and try<br=
>
to find out what changed and why. This takes time which I don&#39;t have.<b=
r>
I&#39;ll probably only get to this after the next commit window, sorry.<br>
<br>
Guenter<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/hwmon/aspeed-pwm-<wbr>tacho.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/hwmon/aspeed-pwm-<wbr>tacho.c b/drivers/hwmon/asp=
eed-pwm-<wbr>tacho.c<br>
&gt; index 86e2ea8287a7..b2ab5612d8a4 100644<br>
&gt; --- a/drivers/hwmon/aspeed-pwm-<wbr>tacho.c<br>
&gt; +++ b/drivers/hwmon/aspeed-pwm-<wbr>tacho.c<br>
&gt; @@ -160,7 +160,7 @@<br>
&gt;=C2=A0 =C2=A0* 11: reserved.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 #define M_TACH_MODE 0x02 /* 10b */<br>
&gt; -#define M_TACH_UNIT 0x1000<br>
&gt; +#define M_TACH_UNIT 0x00c0<br>
&gt;=C2=A0 #define INIT_FAN_CTRL 0xFF<br>
&gt;<br>
&gt;=C2=A0 struct aspeed_pwm_tacho_data {<br>
&gt; --<br>
&gt; 2.13.1.611.g7e3b11ae1-goog<br>
&gt;<br>
</blockquote></div></div>

--94eb2c1170e21fa2230552a5ae64--
