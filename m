Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta23.messagelabs.com ([67.219.246.3]:61564 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726774AbeHKBy5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Aug 2018 21:54:57 -0400
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Guenter Roeck <linux@roeck-us.net>
CC: Jean Delvare <jdelvare@suse.com>,
        PACKHAM Chris <chris.packham@alliedtelesis.co.nz>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH v3 0/4] hwmon: (adt7475) Add error handling for update
 function
Date: Fri, 10 Aug 2018 23:22:51 +0000
Message-ID: <TY2PR01MB2169D6EE3D6957BF54B7954EDC240@TY2PR01MB2169.jpnprd01.prod.outlook.com>
References: <20180808013219.26118-1-ikegami@allied-telesis.co.jp>
 <20180810161333.GA3404@roeck-us.net>
In-Reply-To: <20180810161333.GA3404@roeck-us.net>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter-san,

Thank you so much for your support.
I am very happy with this.

Regards,
Ikegami

> -----Original Message-----
> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter
> Roeck
> Sent: Saturday, August 11, 2018 1:14 AM
> To: IKEGAMI Tokunori
> Cc: Jean Delvare; PACKHAM Chris; linux-hwmon@vger.kernel.org
> Subject: Re: [PATCH v3 0/4] hwmon: (adt7475) Add error handling for updat=
e
> function
>=20
> On Wed, Aug 08, 2018 at 10:32:15AM +0900, Tokunori Ikegami wrote:
> > Currently the device update function does not care the I2C SMBus error.
> > This causes a spurious sensor warining detection by sensor application.
> > To prevent this issue add error handling for the update function.
> > Also change the show functions to return error pointer value.
> >
> > Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Cc: linux-hwmon@vger.kernel.org
> >
> > Tokunori Ikegami (4):
> >   hwmon: (adt7475) Split device update function to measure and limits
> >   hwmon: (adt7475) Change valid parameter to bool type
> >   hwmon: (adt7475) Change update functions to add error handling
> >   hwmon: (adt7475) Change show functions to return error data correctly
> >
>=20
> Series applied to hwmon-next.
>=20
> Thanks,
> Guenter
