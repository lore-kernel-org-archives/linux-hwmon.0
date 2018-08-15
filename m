Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta23.messagelabs.com ([67.219.246.3]:42555 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725876AbeHOIxg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Aug 2018 04:53:36 -0400
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Guenter Roeck <linux@roeck-us.net>,
        Dan Carpenter <dan.carpenter@oracle.com>
CC: Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH 2/2 v2] hwmon: (adt7475) Make adt7475_read_word() return
 errors
Date: Wed, 15 Aug 2018 06:02:46 +0000
Message-ID: <TY2PR01MB216928C2DF3E2976F4E9BDADDC3F0@TY2PR01MB2169.jpnprd01.prod.outlook.com>
References: <TYAPR01MB2175C5AA4B777C61CB0AE04DDC380@TYAPR01MB2175.jpnprd01.prod.outlook.com>
 <20180814100747.oovzd66gxmm755nr@kili.mountain>
 <20180814134049.GA607@roeck-us.net>
In-Reply-To: <20180814134049.GA607@roeck-us.net>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter-san,

Could you please let me know the git repository that applied the fixes by D=
an-san?

Regards,
Ikegami

> -----Original Message-----
> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter
> Roeck
> Sent: Tuesday, August 14, 2018 10:41 PM
> To: Dan Carpenter
> Cc: Jean Delvare; IKEGAMI Tokunori; linux-hwmon@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: Re: [PATCH 2/2 v2] hwmon: (adt7475) Make adt7475_read_word()
> return errors
>=20
> On Tue, Aug 14, 2018 at 01:07:47PM +0300, Dan Carpenter wrote:
> > The adt7475_read_word() function was meant to return negative error
> > codes on failure.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Reviewed-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
>=20
> Applied.
>=20
> Thanks,
> Guenter
