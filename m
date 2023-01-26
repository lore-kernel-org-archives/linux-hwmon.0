Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD09C54EAA
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 22:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbjAZWtW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 17:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232367AbjAZWtU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 17:49:20 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 50B9D47ED3
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 14:49:14 -0800 (PST)
IronPort-SDR: qvht4nr2ovjAhcEiE3dr2yho1EreMosILt5FxQwKoCPCyzYfaFP8vfoXbKWQgK5wiqBcwKhhna
 1cIIyPYtBaFzVswyIEcehgG9f96eMLghr94wX1bva3ow3atqLYndGPTOs/ywHHvsExEz+v6/4m
 B9JVB7JHU8aSYsj87yQS9u40nIvHvJh0UgET3Rl6j9R+qHqdL/rkbSZ57u1OsoXYj8f+C1Fehz
 QAidB0tFkVExSyALeg0JlnBrlVKUQ05Gf9ZEHVdQgDS7fmlGUKWhBXO50wbAVdJpiJm7FPxlSN
 LDHGYeEt0bjupNVGo34hiVG7
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2ByAACkAtNj//Qc8jxaGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUAJgTUDAQEBCwGCLIJglW0DnzsPAQ8BAUQEAQGFBwKFIyY3Bg4BAgQBA?=
 =?us-ascii?q?QEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEgSoHC1IHC1gHB4FBC4FhEwsDBAglD?=
 =?us-ascii?q?YZVAQEBAQIBJxkBATcBDwsOCi5XBhOFfiOqPXiBATOBAYIIAQEGgmOaZoFeC?=
 =?us-ascii?q?YFAAZArekM/gU6CUYFuPoREhj+OH408CoE5eIElDoFGgQ8CCQIRdB83AxkrH?=
 =?us-ascii?q?UADCzsyCj81CwtKEBsaGweBBiooFQMEBAMCBhMDIgINKDEUBCkTDScmaQkCA?=
 =?us-ascii?q?yJiAwMEKC0JPwcVESQ8B1Y3AQUCDx83BgMJAwIfT3IuERMFAwsVKkcECDYFB?=
 =?us-ascii?q?hw2EgIIDxIPBiZEDkI3NBMGXAEpCw4RA1CBTgQvgWIGKSaeOWsHWTUcMoEjk?=
 =?us-ascii?q?z8KkC2gMIN8gVKfSYFEp2aXTYQGnh6FQwIKBxaBeIF/TR8ZgyJPAQIBAQENA?=
 =?us-ascii?q?QIBAQMBAgEBAQkBAQEBgTOMaoIskUthOwIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:2+AcHhZQpiFG/BnYky2pTZH/LTAZhN3EVzX9orItiq5VNK+59ovsO
 1bTo/hokRnIUcPS9qEMgvDd5qbnX2FI+pOdqDYYfZlLSxJAiN1DkQAsWpzaAET3fvK2MHxoR
 ZYQX1U8pyOwOhAKcPs=
IronPort-Data: A9a23:UGT0jatoGdyyhpOhw11PP9DlUOfnVHJYMUV32f8akzHdYApBsoF/q
 tZmKT+Baf+Oa2b8eo1waYri90MH7JaGxoU3TQFp+C01HnwRo5WVCYTDf0r+ZC3NIsCZQBtqt
 J9GYIXKcJ05FiOF+kiEP+m6pxGQ94nRFuKmUrKs1gOd5ONAYH184f62s7dh2uaEufDgX0XV/
 4maT/T3YDdJ4RYtWo4pw/vrRC1H7KyaVAww5jTSVdgT1LMJvyR94Do3fMldHlOgKmVmNrfSq
 9XrkNlVyljkEyIFUbtJpFpannoiGdY+NSDW4pZftjPLbhJq/kTe2Y5jXBYQhNs+Zzihx7hMJ
 NtxWZOYQDo2HvfRubomQwgEEiFENLd75eDYLi3q2SCT5xWun3rEyfRyFwc9J4QH9OFtDSdD8
 OFeKTxLZw3ra+Cenur9ELU2wJ5zapO3YOvzuVk5pd3dJfg8SJbAa67Q7MBW2y08wM1LALDfa
 4wQdFKDaTycP0UeYQxGVclWcOGAqUTRKQNkuW6vna8e/TP+izZI3r3jGY+AEjCNbZ4NxRbC/
 DOuE37CKhUbMsGPjDqa93WqrvHAkDm9W48IErC8sPlwjzW7xGAeDAMfT1aTuuSihwi1XNc3A
 0gV/Dc+hbI1+UeoC8TmGRu1vBa5UgU0BYIVSbFgrVvdj/CIv0CCGmEYTzUHdMQptYk9Qjls3
 0Lhc87V6SJHuYCKaSiA1+mvvSLuOCgvJHU/eHAbQl5QizX8m70bghXKR9dlNae6iNzpBD39q
 wxmSgBj193/auZVis2GEUD7byGE48OSHlFsum07Skr8s1ojPNb7D2C9wQKDhcusOrp1WXGog
 RDoceCl/ewIAIDleMelGr1VRNlFC96jPSKUullyA5lpyD2p9mXLQGy9yG8mYR01aINeKXqzP
 BOVoh9Y+J5YemeyYq4xaIW0Tc03pUQBKTgHfqyIBjatSsIqHONiwM2JTRTOt10BaGB2zckC1
 W6zKK5BzR8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035jubBOSHFEu9eaAfmggUFAEWs/VW9H
 zF3aZbi9vmjeLevCsUq2dRMdglRdShT6W7e9p0MLLXrzvVa9JEJUKeKkel7KuSJboxJjuiA/
 3ehV1VexUaXuJE0AVviV52iAZuxNatCQYUTZHR3bAvxhydzO+5CLs43LvMKQFXuz8Q7pdYcc
 hXPU57o7i1nRmuV9jIDQ4P6qYA+Jh2niRjXb3iuejEgcZl6S0rE/8Kifwep/TRXVni7ss43o
 ruB0ALHQMNdGF47XJ+NNaiinwGroHwQuONuRE+WcNNdT0Xb9tQ4ISLGka5lKs4BHhzP2z+G2
 lvEGhwfv+TM/dM4/YCR16CJpoukCcVkGU9eEzWJ5Lq6L3CKrGG5yJBOV/yEOz3YSSX19OOre
 LwNnf37NfQGmndMspZ9Sug0l/tuvoCy/bIDl1ZqBnTGaVivG4hMGHje0JkdrLBJy59YpRCyB
 BCF9O5aDrPVasnrJ0FAdgMqY9OK2ewQhjSPv+8+J1/35XEr8beKDRdSMh2LhHAPJbd5Ktl+k
 +0gpNVQ4Ba2lRQtKNrAgyVJsWWAaHUdCv11upYfCY7tqwwq1lAbP8OGU3+vu8zVZoUeKFQuL
 x+VmLHG2eZWyH3CRHxvR3LD6vUM150BtSdDwEIGO1nUyMHOgeU63UMN/DlrHB5ZyA5Lj7B6N
 mRxbBcne/3LpWsywZITGjrwR0daGBSF+0e310MGlSvSSEzuX3GUdD8xPuOE/UY49WNAf2EFo
 +vBmD++DGznLJPrwy8/eU95sPi/H9Z/wQuTysmoEvOME4Q+fTe40LSlYnAFqkW7DM487KEdS
 TKGIAqthXXHCBMt
IronPort-HdrOrdr: A9a23:XmhJHaoaAFHFo0IZgzJetRkaV5r7eYIsimQD101hICG9Evbzqy
 lhpoV56faSskd2ZJhAo6HmBEHjKUmwyXcR2+Us1NiZLWvbUQeTTb2KqLGSpgEIeBeOjtK1t5
 0OT0EWMrSZZmSSz/yKhDVQeOxP/DDoysCVbKvlvg5QpY4GUdAa0+5gMHflLqRpfng7OXPnLu
 vn2iKXzwDQBEgqUg==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 27 Jan 2023 09:19:12 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30QMn7uf2378160
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 27 Jan 2023 09:49:07 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30QMn7uf2378160
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674773347; bh=uTm+W0onGdSnWFhrySf0WWlijSCKdKbVCheCJr4nB/o=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=vF1imw72lqs4DujtUzJQCLL+lTvZVVleUVrgTQhEbIQBvhqoccWwLWfGyil67Pg8g
         yPQa28OOKh1tkLCBHMseL9h7FbS/kRILSgD+/OB5vMjK9XgyL3p8Tc8jFq1kcbyaLZ
         N7iMjwBsxAC13BN5d86UQfELTLP4QpfwAe5lNKVIS9bZdA7fKZS/UKXxirklVlvdU3
         fJk8LrNXgw3t/mFIgijAyIdUzOe7LFBYwUdQzH11cF0DMuf52vOdDx6GGgSxX30nYF
         kvNuOEc9iO9NdQj5AUb4F20KYAYqVsJJ/Pr4sLcvzAZnTUSMgs9gGtzJ5dSzlCJpwS
         Ryi/HX/U057Yw==
Message-ID: <3ee724de76a18a7ab49908aa0d63d33dfc465850.camel@crawford.emu.id.au>
Subject: Re: [PATCH v1 2/7] hwmon: (it87) Disable configuration exit for
 certain chips
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date:   Fri, 27 Jan 2023 09:49:07 +1100
In-Reply-To: <20230126134216.GA1634570@roeck-us.net>
References: <20230126040223.986189-1-frank@crawford.emu.id.au>
         <20230126040223.986189-3-frank@crawford.emu.id.au>
         <20230126134216.GA1634570@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 27 Jan 2023 09:49:07 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 2023-01-26 at 05:42 -0800, Guenter Roeck wrote:
> On Thu, Jan 26, 2023 at 03:02:18PM +1100, Frank Crawford wrote:
> > IT8790E and IT8792E/IT8795E have been identified as chips that can
> > have
> > issues when disabling configuration mode.
> >=20
> > Set to never exit configuration mode.
> >=20
> > Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> > ---
> > =A0drivers/hwmon/it87.c | 8 ++++++++
> > =A01 file changed, 8 insertions(+)
> >=20
> > diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> > index 7049e81f5af1..c5e46b94f0b8 100644
> > --- a/drivers/hwmon/it87.c
> > +++ b/drivers/hwmon/it87.c
> > @@ -2453,6 +2453,13 @@ static int __init it87_find(int sioaddr,
> > unsigned short *address,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> > =A0=A0=A0=A0=A0=A0=A0=A0case IT8792E_DEVID:
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sio_data->type =3D it87=
92;
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/*
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * Disabling configuratio=
n mode on IT8792E can
> > result in system
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * hang-ups and access fa=
ilures to the Super-IO
> > chip at the
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * second SIO address. Ne=
ver exit configuration
> > mode on this
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * chip to avoid the prob=
lem.
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0doexit =3D false;
>=20
> Why not just use a feature flag ?

Good point.  I'll rework it to do that.

>=20
> Guenter

Regards
Frank
>=20
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> > =A0=A0=A0=A0=A0=A0=A0=A0case IT8771E_DEVID:
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sio_data->type =3D it87=
71;
> > @@ -2474,6 +2481,7 @@ static int __init it87_find(int sioaddr,
> > unsigned short *address,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> > =A0=A0=A0=A0=A0=A0=A0=A0case IT8790E_DEVID:
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sio_data->type =3D it87=
90;
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0doexit =3D false;=A0/* Se=
e IT8792E comment above */
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> > =A0=A0=A0=A0=A0=A0=A0=A0case IT8603E_DEVID:
> > =A0=A0=A0=A0=A0=A0=A0=A0case IT8623E_DEVID:
> > --=20
> > 2.39.1
> >=20
