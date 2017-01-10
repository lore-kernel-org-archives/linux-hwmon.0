Return-path: <eajames@us.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20170110175112.GA13904@roeck-us.net>
Subject: Re: [PATCH linux 2/6] hwmon: occ: Add sysfs interface
To: Guenter Roeck <linux@roeck-us.net>
Cc: andrew@aj.id.au, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>,
        corbet@lwn.net, devicetree@vger.kernel.org, eajames.ibm@gmail.com,
        jdelvare@suse.com, joel@jms.id.au, linux-doc@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        wsa@the-dreams.de
From: "Edward James" <eajames@us.ibm.com>
Date: Tue, 10 Jan 2017 17:01:10 -0600
References: <1483120568-21082-1-git-send-email-eajames.ibm@gmail.com>
 <1483120568-21082-3-git-send-email-eajames.ibm@gmail.com>
 <20161230193404.GB8516@roeck-us.net>
 <OFA812992D.D19B1368-ON002580A0.007A2966-862580A0.007A72F0@notes.na.collabserv.com>
 <8b182766-32a0-9eb1-7917-14abf811cef5@roeck-us.net>
 <1484070104.21117.29.camel@kernel.crashing.org>
 <20170110175112.GA13904@roeck-us.net>
Content-type: multipart/alternative;
	Boundary="0__=8FBB0A37DFED812A8f9e8a93df938690918c8FBB0A37DFED812A"
Content-Disposition: inline
Message-Id: <OF14D1346C.03F99D0C-ON002580A4.007E07BA-862580A4.007E7368@notes.na.collabserv.com>
List-ID: <linux-hwmon@vger.kernel.org>


--0__=8FBB0A37DFED812A8f9e8a93df938690918c8FBB0A37DFED812A
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



Guenter Roeck <linux@roeck-us.net> wrote on 01/10/2017 11:51:12 AM:

> From: Guenter Roeck <linux@roeck-us.net>
> To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Edward James/Austin/IBM@IBMUS, andrew@aj.id.au, corbet@lwn.net,
> devicetree@vger.kernel.org, eajames.ibm@gmail.com,
> jdelvare@suse.com, joel@jms.id.au, linux-doc@vger.kernel.org, linux-
> hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, linux-
> kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
> wsa@the-dreams.de
> Date: 01/10/2017 11:51 AM
> Subject: Re: [PATCH linux 2/6] hwmon: occ: Add sysfs interface
>
> On Tue, Jan 10, 2017 at 11:41:44AM -0600, Benjamin Herrenschmidt wrote:
> > On Sat, 2017-01-07 at 09:15 -0800, Guenter Roeck wrote:
> > > > Instead of the "online" attribute, what do you think about using
the
> > > > "bind"/"unbind" API to probe the device from user space once the
system
> > > > is powered on? All the hwmon registration would take place in the
probe
> > > > function, it would just occur some time after boot.
> > > >
> > >
> > > A more common approach would be to have a platform driver. That
platform
> > > driver would need a means to detect if the OCC is up and running, and
> > > instantiate everything else once it is.
> > >
> > > A trigger from user space is problematic because there is no
guarantee
> > > that the OCC is really up (or that it even exists).
> > >
> > > An alternative might be to have the hwmon driver poll for the OCC,
> > > but that would be a bit more difficult and might require a kernel
thread
> > > or maybe asynchronous probing.
> >
> > Hi Guenter !
> >
> > I'm not sure I agree with you here ;-)
> >
> > I'm don't know how much background you got (I missed the beginning of
> > the discussion) but basically this driver runs on the BMC (system
> > controller) of the POWER9 server, the OCC is inside the POWER9 chip
> > itself.
> >
> > So the presence/power state of the OCC doesn't depend on the BMC
> > platform kernel code. The BMC userspace controls power up and down
> to the POWER9, and thus it's the one to know whether the remote is up.
> >
> > If we were to create a "platform driver", all it would do is get input
> > from userspace exactly like that sysfs file :-)
> >
> > So if you don't like the sysfs file that registers/de-registers, which
> > I sort-of understand, it's a bit of a hack (though a rather efficient
> > one), I think the bind/unbind approach makes sense. However, I wonder
> > whether the simplest and most efficient (remember this BMC has a really
> > slow CPU) is an "online" file sysfs file, though rather than
> > registering/de-registering the hwmon it would simply make it stop
> > accessing the HW (and return some known "offline" values).
> >
>
> I don't like that too much either; it still looks like a hack.
> How about using bind/unbind then ?

Bind/unbind works very well in testing. Only thing we have to figure out is
how to stop the driver loading during BMC boot... but I don't think the
solution will be in this patch set. I'll put together a v2 for tomorrow.

Thanks,
Eddie

>
> Guenter
>

--0__=8FBB0A37DFED812A8f9e8a93df938690918c8FBB0A37DFED812A
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>Guenter Roeck &lt;linux@roeck-us.net&gt; wrote on 01/10/=
2017 11:51:12 AM:<br><br>&gt; From: Guenter Roeck &lt;linux@roeck-us.net&gt=
;</tt><br><tt>&gt; To: Benjamin Herrenschmidt &lt;benh@kernel.crashing.org&=
gt;</tt><br><tt>&gt; Cc: Edward James/Austin/IBM@IBMUS, andrew@aj.id.au, co=
rbet@lwn.net, <br>&gt; devicetree@vger.kernel.org, eajames.ibm@gmail.com, <=
br>&gt; jdelvare@suse.com, joel@jms.id.au, linux-doc@vger.kernel.org, linux=
-<br>&gt; hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, linux-<br>&gt; =
kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, <br>&gt; =
wsa@the-dreams.de</tt><br><tt>&gt; Date: 01/10/2017 11:51 AM</tt><br><tt>&g=
t; Subject: Re: [PATCH linux 2/6] hwmon: occ: Add sysfs interface</tt><br><=
tt>&gt; <br>&gt; On Tue, Jan 10, 2017 at 11:41:44AM -0600, Benjamin Herrens=
chmidt wrote:<br>&gt; &gt; On Sat, 2017-01-07 at 09:15 -0800, Guenter Roeck=
 wrote:<br>&gt; &gt; &gt; &gt; Instead of the &quot;online&quot; attribute,=
 what do you think about using the<br>&gt; &gt; &gt; &gt; &quot;bind&quot;/=
&quot;unbind&quot; API to probe the device from user space once the system<=
br>&gt; &gt; &gt; &gt; is powered on? All the hwmon registration would take=
 place in the probe<br>&gt; &gt; &gt; &gt; function, it would just occur so=
me time after boot.<br>&gt; &gt; &gt; &gt; <br>&gt; &gt; &gt; <br>&gt; &gt;=
 &gt; A more common approach would be to have a platform driver. That platf=
orm<br>&gt; &gt; &gt; driver would need a means to detect if the OCC is up =
and running, and<br>&gt; &gt; &gt; instantiate everything else once it is.<=
br>&gt; &gt; &gt; <br>&gt; &gt; &gt; A trigger from user space is problemat=
ic because there is no guarantee<br>&gt; &gt; &gt; that the OCC is really u=
p (or that it even exists).<br>&gt; &gt; &gt; <br>&gt; &gt; &gt; An alterna=
tive might be to have the hwmon driver poll for the OCC,<br>&gt; &gt; &gt; =
but that would be a bit more difficult and might require a kernel thread<br=
>&gt; &gt; &gt; or maybe asynchronous probing.<br>&gt; &gt; <br>&gt; &gt; H=
i Guenter !<br>&gt; &gt; <br>&gt; &gt; I'm not sure I agree with you here ;=
-)<br>&gt; &gt; <br>&gt; &gt; I'm don't know how much background you got (I=
 missed the beginning of<br>&gt; &gt; the discussion) but basically this dr=
iver runs on the BMC (system<br>&gt; &gt; controller) of the POWER9 server,=
 the OCC is inside the POWER9 chip<br>&gt; &gt; itself.<br>&gt; &gt; <br>&g=
t; &gt; So the presence/power state of the OCC doesn't depend on the BMC<br=
>&gt; &gt; platform kernel code. The BMC userspace controls power up and do=
wn<br>&gt; to the POWER9, and thus it's the one to know whether the remote =
is up.<br>&gt; &gt; <br>&gt; &gt; If we were to create a &quot;platform dri=
ver&quot;, all it would do is get input<br>&gt; &gt; from userspace exactly=
 like that sysfs file :-)<br>&gt; &gt; <br>&gt; &gt; So if you don't like t=
he sysfs file that registers/de-registers, which<br>&gt; &gt; I sort-of und=
erstand, it's a bit of a hack (though a rather efficient<br>&gt; &gt; one),=
 I think the bind/unbind approach makes sense. However, I wonder<br>&gt; &g=
t; whether the simplest and most efficient (remember this BMC has a really<=
br>&gt; &gt; slow CPU) is an &quot;online&quot; file sysfs file, though rat=
her than<br>&gt; &gt; registering/de-registering the hwmon it would simply =
make it stop<br>&gt; &gt; accessing the HW (and return some known &quot;off=
line&quot; values).<br>&gt; &gt; <br>&gt; <br>&gt; I don't like that too mu=
ch either; it still looks like a hack.<br>&gt; How about using bind/unbind =
then ?</tt><br><br><tt>Bind/unbind works very well in testing. Only thing w=
e have to figure out is</tt><br><tt>how to stop the driver loading during B=
MC boot... but I don't think the</tt><br><tt>solution will be in this patch=
 set. I'll put together a v2 for tomorrow.</tt><br><br><tt>Thanks,</tt><br>=
<tt>Eddie</tt><br><tt><br>&gt; <br>&gt; Guenter<br>&gt; <br></tt><BR>
</body></html>

--0__=8FBB0A37DFED812A8f9e8a93df938690918c8FBB0A37DFED812A--
