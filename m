Return-path: <eajames@us.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1485031997.2495.4.camel@kernel.crashing.org>
Subject: Re: [PATCH linux v3 3/6] hwmon: occ: Add I2C transport implementation for
 SCOM operations
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: andrew@aj.id.au, corbet@lwn.net, devicetree@vger.kernel.org,
        eajames.ibm@gmail.com, jdelvare@suse.com, joel@jms.id.au,
        Guenter
 Roeck
 <linux@roeck-us.net>, linux-doc@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
From: "Edward James" <eajames@us.ibm.com>
Date: Mon, 23 Jan 2017 18:00:12 -0600
References: <1484601219-30196-1-git-send-email-eajames.ibm@gmail.com>
 <1484601219-30196-4-git-send-email-eajames.ibm@gmail.com>
 <b47e5359-5587-cc89-43e2-379eb9e95fc8@roeck-us.net>
 <1485031997.2495.4.camel@kernel.crashing.org>
Content-type: multipart/alternative;
	Boundary="0__=8FBB0A22DF1024E38f9e8a93df938690918c8FBB0A22DF1024E3"
Content-Disposition: inline
Message-Id: <OF876E06AB.A46DF4AD-ON002580B1.0083A273-862580B2.0000050C@notes.na.collabserv.com>
List-ID: <linux-hwmon@vger.kernel.org>


--0__=8FBB0A22DF1024E38f9e8a93df938690918c8FBB0A22DF1024E3
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1



Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote on 01/21/2017
02:53:17 PM:
> On Sat, 2017-01-21 at 10:11 -0800, Guenter Roeck wrote:
> > > +int occ=5Fi2c=5Fgetscom(void *bus, u32 address, u64 *data)
> > > +{
> > > +=A0=A0=A0=A0=A0ssize=5Ft rc;
> > > +=A0=A0=A0=A0=A0u64 buf;
> > > +=A0=A0=A0=A0=A0struct i2c=5Fclient *client =3D bus;
> > > +
> > > +=A0=A0=A0=A0=A0rc =3D i2c=5Fmaster=5Fsend(client, (const char *)&add=
ress,
> > > sizeof(u32));
> > > +=A0=A0=A0=A0=A0if (rc < 0)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return rc;
> > > +=A0=A0=A0=A0=A0else if (rc !=3D sizeof(u32))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EIO;
> > > +
> > > +=A0=A0=A0=A0=A0rc =3D i2c=5Fmaster=5Frecv(client, (char *)&buf, size=
of(u64));
> > > +=A0=A0=A0=A0=A0if (rc < 0)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return rc;
> > > +=A0=A0=A0=A0=A0else if (rc !=3D sizeof(u64))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EIO;
> > > +
> > > +=A0=A0=A0=A0=A0*data =3D be64=5Fto=5Fcpu(buf);
> > > +
> > > +=A0=A0=A0=A0=A0return 0;
> > > +}
> > > +EXPORT=5FSYMBOL(occ=5Fi2c=5Fgetscom);
>
> Additionally, this assumes that is is the only other user of that i2c
> path to P8. Something interleaving will break it. pdbg for example.
>
> Talk to Alistair, the right thing here would probably be to have
> a separate driver that provides the XSCOM interface via i2c to both
> in-kernel and userspace, with proper arbitration.
>
> An expedient might be to instead have the address and data cycles
> of the above be 2 i2c messages in one i2c request, thus being
> serialized somewhat atomically with other transactions to that i2c
> bus.
>
> You may need to make sure the underlying i2c controller driver supports
> dual messages, and if it doesn't fix it. This is rather classic 4-bytes
> subaddress style i2c, it shouldn't be too hard.

Agreed, no one has experienced any issues, but it is a hole that should be
addressed. I just tested with i2c=5Ftransfer instead of send and receive and
it seems to work fine. I'll include that in the next patch set.

Thanks,
Eddie

>
> Cheers,
> Ben.
>

--0__=8FBB0A22DF1024E38f9e8a93df938690918c8FBB0A22DF1024E3
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p><tt>Benjamin Herrenschmidt &lt;benh@kernel.crashing.org&gt; =
wrote on 01/21/2017 02:53:17 PM:<br>&gt; On Sat, 2017-01-21 at 10:11 -0800,=
 Guenter Roeck wrote:<br>&gt; &gt; &gt; +int occ=5Fi2c=5Fgetscom(void *bus,=
 u32 address, u64 *data)<br>&gt; &gt; &gt; +{<br>&gt; &gt; &gt; +=A0=A0=A0=
=A0=A0ssize=5Ft rc;<br>&gt; &gt; &gt; +=A0=A0=A0=A0=A0u64 buf;<br>&gt; &gt;=
 &gt; +=A0=A0=A0=A0=A0struct i2c=5Fclient *client =3D bus;<br>&gt; &gt; &gt=
; +<br>&gt; &gt; &gt; +=A0=A0=A0=A0=A0rc =3D i2c=5Fmaster=5Fsend(client, (c=
onst char *)&amp;address,<br>&gt; &gt; &gt; sizeof(u32));<br>&gt; &gt; &gt;=
 +=A0=A0=A0=A0=A0if (rc &lt; 0)<br>&gt; &gt; &gt; +=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0return rc;<br>&gt; &gt; &gt; +=A0=A0=A0=A0=A0else if (rc !=
=3D sizeof(u32))<br>&gt; &gt; &gt; +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
return -EIO;<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +=A0=A0=A0=A0=A0rc =3D i=
2c=5Fmaster=5Frecv(client, (char *)&amp;buf, sizeof(u64));<br>&gt; &gt; &gt=
; +=A0=A0=A0=A0=A0if (rc &lt; 0)<br>&gt; &gt; &gt; +=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0return rc;<br>&gt; &gt; &gt; +=A0=A0=A0=A0=A0else if (rc =
!=3D sizeof(u64))<br>&gt; &gt; &gt; +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return -EIO;<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +=A0=A0=A0=A0=A0*data=
 =3D be64=5Fto=5Fcpu(buf);<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +=A0=A0=A0=
=A0=A0return 0;<br>&gt; &gt; &gt; +}<br>&gt; &gt; &gt; +EXPORT=5FSYMBOL(occ=
=5Fi2c=5Fgetscom);<br>&gt; <br>&gt; Additionally, this assumes that is is t=
he only other user of that i2c<br>&gt; path to P8. Something interleaving w=
ill break it. pdbg for example.<br>&gt; <br>&gt; Talk to Alistair, the righ=
t thing here would probably be to have<br>&gt; a separate driver that provi=
des the XSCOM interface via i2c to both<br>&gt; in-kernel and userspace, wi=
th proper arbitration.<br>&gt; <br>&gt; An expedient might be to instead ha=
ve the address and data cycles<br>&gt; of the above be 2 i2c messages in on=
e i2c request, thus being<br>&gt; serialized somewhat atomically with other=
 transactions to that i2c<br>&gt; bus.<br>&gt; <br>&gt; You may need to mak=
e sure the underlying i2c controller driver supports<br>&gt; dual messages,=
 and if it doesn't fix it. This is rather classic 4-bytes <br>&gt; subaddre=
ss style i2c, it shouldn't be too hard.</tt><br><br><tt>Agreed, no one has =
experienced any issues, but it is a hole that should be</tt><br><tt>address=
ed. I just tested with i2c=5Ftransfer instead of send and receive and</tt><=
br><tt>it seems to work fine. I'll include that in the next patch set.</tt>=
<br><br><tt>Thanks,</tt><br><tt>Eddie</tt><br><tt><br>&gt; <br>&gt; Cheers,=
<br>&gt; Ben.<br>&gt; <br></tt><BR>
</body></html>

--0__=8FBB0A22DF1024E38f9e8a93df938690918c8FBB0A22DF1024E3--
