Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37ACEC05027
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 22:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbjAZWzO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 17:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbjAZWzN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 17:55:13 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EC2294AA49
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 14:55:02 -0800 (PST)
IronPort-SDR: rGknNdWE1LVyhym5abGDnpzUuq82q8zAU7zw5Wct2jSdOw2sXFDNOd+Ej/O08kOKapAxP57Zm0
 pIHzmpcwl/N0N5XG63cAHa4RZlgsnC4JcJVZY6yjsfR3/2st7RMC08raHna5bBA0n6GpMpEgTa
 00Hc90SX7Skl8uTJaFlhlXM+9dZJKnFFTk7MlAAYhz5ayfkg5ustK0rdl5YxC7PQXETrImpY3e
 RByx/CBsQ6lLnrTZfyqpox8hW5Qfr5jZPWDwWRK1mnlyOUSU/9MLxQYdE1POsfCYZkZmBp90CK
 oMk8djSigwFc7LTCRz7/6EHB
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AmAABaA9Nj//Qc8jxaGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUAJgTMFAQEBCwGCLIJglXCdPYF+DwEPAQFEBAEBhQcChSMmNQgOAQIEA?=
 =?us-ascii?q?QEBAQMCAwEBAQEBAQMBAQYBAQEBAQEGBIEqBwtSBwtYBweBQQuBYRMLAzENh?=
 =?us-ascii?q?lYBAQEDJxkBATcBDwsOCi5XBhOGIasxgQEzgQGCCAEBBoJjmmaBXgmBQAGMX?=
 =?us-ascii?q?YNOekM/gU6CUYFuPoREhj+OH408CoE5eIElDoFGgQ8CCQIRdB83AxkrHUADC?=
 =?us-ascii?q?zsyCj81CwtKEBsaGweBBiooFQMEBAMCBhMDIgINKDEUBCkTDScmaQkCAyJiA?=
 =?us-ascii?q?wMEKC0JPwcVESQ8B1Y3AQUCDx83BgMJAwIfT3IuERMFAwsVKkcECDYFBhw2E?=
 =?us-ascii?q?gIIDxIPBiZEDkI3NBMGXAEpCw4RA1CBTgQvgWIGKSaeMQhrB4EOgSejDoEyo?=
 =?us-ascii?q?DCDfIFSn0mBRII1pTEtlyCCTKUbAgoHFoFkAYISTR8ZgyJPAQIBAQENAQIBA?=
 =?us-ascii?q?QMBAgEBAQkBAQEBjh2CLJFLYTsCBwsBAQMJjCMBAQ?=
IronPort-PHdr: A9a23:1lJTrhSfNoPuU6rVvi2d3rrMu9pso4vLVj580XJvo7hPbr/l9I7rI
 0LY//krgVrUG4TXrftZ2KLfqau1X2sG7N6atWwaNoZBUhgZhIAXh1kuDMLfWxLyJfK4Y3BlT
 JYbBg1u9SjjY0NeQJmWWg==
IronPort-Data: A9a23:iAf6WKNy6wMbAvHvrR2BkcFynXyQoLVcMsEvi/4bfWQNrUokgzcAz
 zFKCD+AOvyJMDDyc4pwad+3oE1TvZSHzYBjHQA/rywyHn8SopTJCY3Echj+Y3+YIJSTFh5p5
 MhEO4WYBc1lFXW0SjWFa+i59yMgvU2rqhsQLMaeZ0idkCc9EH9JZSpLwrJ/2sgy6TSAK1vlV
 ena+qUzBXf8s9JKGjJMg068gEsHUMTa4Fv0aXRjDRzjlAa2e0g9VPrzF4noR5fLatU88tqBe
 gr25OrRElU1XvsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0o2HKJ0VKtZt9mGt/R39
 MQS7p6BcEQGeb2XleUeYwlCTD4raMWq+JefSZS+mcaS01aAeGHl3PtpFk1wMIgFvOd7R2hTn
 RAaAG5VKErf3aTskPThFrUEascLdaEHOKsRoHhmzhnSF/85T5fZT+PH4MIe3Tt2j90m8fP2O
 5ZBOGEzN06YC/FJEmwQJY8SmsaWuifELAMAogmquo086EGGmWSd15C2aIGFIIbbLSlPpW6cp
 2Tb7yH5HRQdMvSBxjeftHGhnOnCmWX8Qo16PL+0+/p0iUee7ncOExBQXly+ydG9i0ijS/pFL
 EEf+W8ztu40+VDDczXmd0Pg5STY5FtGC58KT7F88x2E1qvfpRqBCWlCRTlELtU73CMredA0/
 nuPo8K2Xj5eif66DmLG+7aXnSOoZjdAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJYjvdRGGYL
 9ei8nVWulkDsSIY/+DgpgCY2m7ESozhF1NsvF2PAApJ+ysjPOaYi5qUBU/zxMsowGyxdUiNu
 nUV8yR1xLpWVcnleMClZugSVIqu+uqFeALVhVN0d6TNGhzzozv5IdoVumE7fhs1dN0YcCPoa
 wnPoQxQopRUOT2jcMebgr5d6ex2kcAM9vy/DZg4i+aihbArKme6ENlGPxL44owUuBFEfGFWE
 c7znTyQJXgbE7976zG9Wv0Q17QmrghnmzyPGs2kn0//iuLCDJJwdVvjGAbeBgzexP3ZyDg5D
 /4FZqNmNj0FD7anOXGHmWLtBQ1bdiJgbXwJlyCnXrXbeVo8QjBJ5w753asuM41jg6lPkOrUl
 kxRqWcGoGcSRBTvd223V5yUQOi3B8wk9CJlZnRE0JTB8yFLXLtDJZw3L/MfFYTLPsQ6pRKtZ
 /VaKciGHNpVTTHLp2YUYZXn9dwwfw6imgyJJSbjbT0iOZ9sAQXUo4e2cgzq/SgILyy2qcpn/
 eL6j1OCHsJaSlQwFtvSZdKu00i14yoXltVyaE2UcNNdT1q9ooFlJhv4guIzP8xRew7IwSGX1
 ljKDBpB/bvNroY5/cPnn6eBq4v1QeJyElADTzvQ97+pOy7A8iyuxJIGUerOdC2EDDH4/6CrZ
 ON0yfDgMaRZwwwT49MjS+9mlPts6cHuqrlWyhVfME/KN1n7WKl9JnSm3NVUsvMfzLFuuTywB
 hCF9O5FaOeAN87SGVIMIBYoM7aY3vYOlziMsfk4LRmo5CJz+7bbA0xeMwPW035XLadudog/y
 Pgvv9QarQG6l1wrPpCPk3kMpWiLK3UBVYQht40bWdG00FN7kw4aOJGMWDXr5JyvaslXNhd4K
 DGjhJ3E2+ZWyH3dIig6GnX61OZAgYgD5UJRx1gYKlXXxtfI2q0t0BtK/WhlRwhZ1E4dgbwrf
 zI3bQgvdeDUo2sun9RKQ2GnXR1ZCxzf8Uv0jVIUzTWLQ06tX23LDWs8JefUoh9DqjIFIWAC8
 eHK0nvhXBbrYNr1gnk4V3lj+q7qQtFG/wHfnNyqQpaeFJ4gbDu73qKjaALkcfc87R/dWaEfm
 dRXwQ==
IronPort-HdrOrdr: A9a23:hpvstqiJDP0nCLOaYDxNR1WONXBQXgoji2hC6mlwRA09TyX5ra
 qTdTogpHzJYVEqKRcdcLG7Sc69qRG1z/NICOwqUYtKMzOW2ldAQLsC0WKm+UyEJ8SczJ8k6U
 4DScdD4bTLZDAQsS+52njdLz9K+re6Gc6T5ds2g00dND2D5MxbnnxE4x6gYzJLrRd9dOYE/U
 Wnl7B6T+vJQwVrUviG
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 27 Jan 2023 09:25:01 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30QMsvWq2379137
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 27 Jan 2023 09:54:57 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30QMsvWq2379137
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674773697; bh=SLTZaJ0u1MgdaGRVMyShcTg+iTdMnkjW0SHghtP/b1g=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=dJwEDRL+Gd4dGy5+WuZLOgHoOD0D0xvD4yol0aulc6s0CF8Mj3QECegxaHyg+XLHh
         lJrQkwF2Y0KfLQH8m9dn8A/JZnzn9ZEw5Is2GjgA0qVqx4GCPnakOZIProEaBf+RFB
         f9jozwwcqaBlEA6IC46vsrE0tq+wwrzep0oBifYZOcXYjxZxAwSk19bVsSZbHs6ueo
         CNeAS8SRFfhZShzEhsvBqTRAsqMiak18ECEojG+lBV5NFrKqbWlkO7uIaisluCsce/
         olublr1kUy5X6iro4QShsFUfFJM/cOUN+R3xnZqYAUjy9yCN+65GtrjjJWg0G8dn+/
         RiGOhqQCbwQTw==
Message-ID: <bde7bd521d3aa6e4a12ae0c52856c28f0b5fb963.camel@crawford.emu.id.au>
Subject: Re: [PATCH v1 4/7] hwmon: (it87) Add chip_id in some info message
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date:   Fri, 27 Jan 2023 09:54:57 +1100
In-Reply-To: <20230126134954.GA1635195@roeck-us.net>
References: <20230126040223.986189-1-frank@crawford.emu.id.au>
         <20230126040223.986189-5-frank@crawford.emu.id.au>
         <20230126134954.GA1635195@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 27 Jan 2023 09:54:57 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 2023-01-26 at 05:49 -0800, Guenter Roeck wrote:
> On Thu, Jan 26, 2023 at 03:02:20PM +1100, Frank Crawford wrote:
> > In cases where there are multiple chips, print out which chip is
> > referred to, in the informational message.
> >=20
> > Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> > ---
> > =A0drivers/hwmon/it87.c | 6 ++++--
> > =A01 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> > index 16394b38dce3..5ca8449887da 100644
> > --- a/drivers/hwmon/it87.c
> > +++ b/drivers/hwmon/it87.c
> > @@ -2505,13 +2505,15 @@ static int __init it87_find(int sioaddr,
> > unsigned short *address,
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0superio_select(sioaddr, PME);
> > =A0=A0=A0=A0=A0=A0=A0=A0if (!(superio_inb(sioaddr, IT87_ACT_REG) & 0x01=
)) {
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_info("Device not activ=
ated, skipping\n");
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_info("Device (DEVID=3D=
0x%x) not activated,
> > skipping\n",
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0c=
hip_type);
>=20
> At this point the textual name (it87_devices[sio_data->type].model)
> is already known. I would suggest to print that instead.

You are right.  I'll update it to do so, although I also realised I
need to also print the sioaddr, so I can distinguish the case where
both chips are listed as the same.  This is most common when force_id
has been used.
>=20
> Thanks,
> Guenter
>=20
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto exit;
> > =A0=A0=A0=A0=A0=A0=A0=A0}
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0*address =3D superio_inw(sioaddr, IT87_BASE_REG=
) &
> > ~(IT87_EXTENT - 1);
> > =A0=A0=A0=A0=A0=A0=A0=A0if (*address =3D=3D 0) {
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_info("Base address not=
 set, skipping\n");
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_info("Base address not=
 set (DEVID=3D0x%x),
> > skipping\n",
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0c=
hip_type);
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto exit;
> > =A0=A0=A0=A0=A0=A0=A0=A0}
> > =A0
> > --=20
> > 2.39.1
> >=20
