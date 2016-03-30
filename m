Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56994 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752388AbcC3QLW (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Wed, 30 Mar 2016 12:11:22 -0400
Date: Wed, 30 Mar 2016 09:10:48 -0700
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Thor Thayer <tthayer@opensource.altera.com>,
	linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com,
	linux@roeck-us.net, robh+dt@kernel.org, pawell.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20160330161048.GB2350@sirena.org.uk>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-4-git-send-email-tthayer@opensource.altera.com>
 <20160330115106.GJ3323@x1>
 <56FBE829.2000607@opensource.altera.com>
 <20160330145239.GM3323@x1>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oMfk58fZ06Sy4zVm"
Content-Disposition: inline
In-Reply-To: <20160330145239.GM3323@x1>
Subject: Re: [RFC 3/8] mfd: altr_a10sr: Add Altera Arria10 DevKit System
 Resource Chip
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


--oMfk58fZ06Sy4zVm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2016 at 03:52:39PM +0100, Lee Jones wrote:
> On Wed, 30 Mar 2016, Thor Thayer wrote:

> > The read register has a different address than the write register
> > which is handled in this function with the masks (read address is
> > odd, write address is even).

> Mark, do we have an API which handled such a configuration?

No, but it sounds like this is a regmap with seven bit register values
and a read/write bit which should be using read_flag_mask rather than
trying to treat these as separate registers.

--oMfk58fZ06Sy4zVm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW+/qCAAoJECTWi3JdVIfQI3sH/Az4Q2ywkkR2AFD0jhZiIZ6V
BmCgMvG1+V+sxyA6sITU13Y3rIjbZ67gp3Us3olwBAUeN0miAT5Gl54H+jwnGhCW
q2Xd3nrR/fK3zDuWpE7RGZWo1T2DgyHNP7tL/3wj8ymk32o8KcR6HYgQMGoTHrif
jRDXmiCoZe/Eli+pa9RjndoZ5Iupjs1zz1v57AXGGTvCuZK6RGsB5ZMhfLl2yhv6
sQtiJUS7q+saPl+csirCgauNUPZ4wemJ2m01WM2FWVSli8wXT4PNrd+/U2SU4lrB
MDySU2s4DS/CrkExBeNNwFXRbEcY3gGFrBv1lmSEwkyckjHNai1Aev+rpw0dMU0=
=8x8q
-----END PGP SIGNATURE-----

--oMfk58fZ06Sy4zVm--
