Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:35840 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751279AbdALJ4r (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Jan 2017 04:56:47 -0500
Date: Thu, 12 Jan 2017 10:56:43 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: eajames.ibm@gmail.com
Cc: linux@roeck-us.net, devicetree@vger.kernel.org, jdelvare@suse.com,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        robh+dt@kernel.org, andrew@aj.id.au, joel@jms.id.au,
        benh@kernel.crashing.org, "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH linux v2 0/6] drivers: hwmon: Add On-Chip Controller
 driver
Message-ID: <20170112095643.GA1477@katana>
References: <1484158237-10014-1-git-send-email-eajames.ibm@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <1484158237-10014-1-git-send-email-eajames.ibm@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This patchset adds a hwmon driver to support the OCC (On-Chip Controller)
> on the IBM POWER8 and POWER9 processors, from a BMC (Baseboard Management
> Controller). The OCC is an embedded processor that provides real time
> power and thermal monitoring.

Please don't cc the I2C list for I2C client drivers unless you have a
specific question about the I2C framework. Same as you usually don't add
the PCI list for every PCI (client) card.


--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYd1LbAAoJEBQN5MwUoCm2RF0QAIhuCMA/crRnFWORlUPBv9i8
eJsIpAARk4ed9n4P8cuW1tpzTHxb1k9O1W2VWTdin/fEIK4hIIOlZQrtisvTGfNF
ug9ErBdePTsnuFb4blStbAclqdIHX4eJBLMEZt2KJ8pq+Ny3dHy2lOUzikSGq6rF
H3NQH4m7mntXzScCzzeZauXddAIwxE7QexuHQ4RKpRwdGZg58dM7po92+FJoUHqc
ohv6uNwPzdsFFTn0aJ/eJWE52D6rJnSxuHSLMV6XMn0yU9WVSByzz05XrlluVbut
RBl1i5wD3aHUbavmIftvk8TN6/wXoKDOCZ4RAw0sYR/HmDvsY2UZ1K5Dx4b3752E
PSawVSVO60MUZLbMVoohoL7wf/Xczecbwx3X0xJjUXUp8ci3QCo6g8syYJ+cc1U3
MWdTuLQUxR1qQq520iaut5S38/vKi/p3ojNMEAT6YzjcMpOXZB2TcfgB6YttiUz4
b6GaJVM+fcwYw8LGVxCalPMznvBi2MFI1baP9aygshMfb2hOyiR0+Bjmmao0o5yC
7HhrGAX3yWuf9DFACSNxTFMnvxOzsrhQbm59HmRekwR7FCGU5swqDCmnlewbnruD
dUtYS1Afy3IV4lFY9svBgKeyPXXsho0NA9sqTl5EjOK6QPbyQNmSlg/KMg3Yu7UZ
48kRMHuUPMEROriTqu/N
=4r6S
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
