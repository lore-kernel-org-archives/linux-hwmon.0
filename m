Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0320C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Nov 2022 23:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbiKVX24 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Nov 2022 18:28:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235300AbiKVX2p (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2022 18:28:45 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2CD4C1F9C4
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 15:28:39 -0800 (PST)
IronPort-SDR: X1eDqV6Bekq6BQeogbYGHR5HMX4ex+lBwobDcSvWHGagp0T64lfBT0qoUeELpDq1FKZec9GoM/
 lmU8F1Xil/aYAV4nBXN0gc/mCOeLkZRAS3y+W3qwQ46O2UbzHu91bf0hjbnZJ+Yq9it9gDp21j
 zbZp8AOm0L6Op8WOhRXNyOqVPZftDquEQWcTmQcZ/OdOa4PYBZELIjSWIZR5aL1OKLCarV3AZm
 Ypl4iHVCOOISWGqC/g0/92v9noIlsHt6quvp1D+4WUpXsRmse0p/7CgR1qJoRbFbHxStwuw9e3
 i5AT6I3g3a8SfRIy/dupL9p5
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AdCQALWn1jjPQc8jxaHQEBAQEJARIBBQUBQAmBRoItg?=
 =?us-ascii?q?lyVaAOfLw8BDwEBRAQBAYUFAoUCJjgTAQIEAQEBAQMCAwEBAQEBAQMBAQYBA?=
 =?us-ascii?q?QEBAQEGBBQBAQEBPxgBOQcLUgcLWAcHgUELgWETCwMxDYZUAQEBA0ABATcBD?=
 =?us-ascii?q?wsOCi5XBhOCfYMjsFCBNIEBgggBAQaCYZplgV4JgUCQFnpDP4FOgRWBCjKBV?=
 =?us-ascii?q?hg+iwKMOot1NwMZKx1AAws7MgpJG1gOCR8cDhcNBQYSAyBsBQo3DygvZyscG?=
 =?us-ascii?q?weBDCooFQMEBAMCBhMDIgINKTEUBCkTDSsnbwkCAyJlBQMDBCgsAwlABxYRJ?=
 =?us-ascii?q?DwHVjoBBAMCDyA4BgMJAwIkVnUuERUFAwsVJQgFSwQIOQUGUxICChEDEg8GJ?=
 =?us-ascii?q?EUOSD45FgYnQgExDg4UA16BaQQ1gXEKMTCbW2s0TgkSKBAMW4FNApJWkAOgD?=
 =?us-ascii?q?oNygU6fOYFEp1SXNKIPTIR0AgoHFoF5gX5NHxmDIk8BAgEBAQ0BAgEBAwECA?=
 =?us-ascii?q?QEBCQEBAQGOHRmCE4w4YTsCBwsBAQMJimIBAQ?=
IronPort-PHdr: A9a23:1osdNR2bCF/EsyLwsmDPn1BlVkEcU/3cNA8J8dwskbtRfKO589LvO
 VGZ5PkrhUKaFYzB4KdCjOzb+7vlRXRG+5uEt2wPNZ1UAhEJhZ9EwAUpDJyJVRKrfqe4PScwR
 ZwQX1Q9oBmG
IronPort-Data: A9a23:8okbSqIeDu/s/u/YFE+R45MlxSXFcZb7ZxGr2PjKsXjdYENS1zxWz
 TFMUG/VP/aDMTenfdx+atzkoUlT6J7cz4JhTAA+pCFkE35A9ZrPWd/AdBv8YHrNdJOZRk5t5
 J1ONYWRdek5HyTWzvuPGuGx9SMmiclkZVZd5MrsYH0ZqdpMEX954f5bs7dlxNYu27BVOivV0
 T/Ii5S31GKNglaYDEpEs8pvlzs31BjCkGtwUosWOJinFHeH/5UkJMp3yZOZdhMUcaEIdgKOf
 Nsv+Znilo/vE7bBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XOdJEAXq7hQllkPhq0
 PhGm7CfSDsZP47WtMQjTR5YGD1XaPguFL/veRBTsOSZzlHdNXD2yupgC1s6e4Ad56B2DSdH6
 JT0KhhTNlbZ27jwmuL9ELUw7iggBJCD0Ic3tGtpyzLxBuwvXp7EWamM6NpFmjY8wMlTdRrbT
 5ZCNmE0NkWdO3WjPH8xEaMMn8v03EDFLRJg8A6XqrIe73n6mVkZPL/Fa4KOKobQFK25hH2wo
 mPA4nS8Ag4fM9q31zWI6DSvi/XJkCe9X5gdfJW6+vNunlSJy0QIFQYbE1C8pJGRjk+4RsJ3M
 UsZ8SlrsLN08kG3JuQRRDXm+Dve4kRZAYoVSbFmrhqRw7bV6ECFHmcFCDVGbZovqafaWADGy
 HeSh/7iKxBAsYGlSFGH2peqszSyMjQ8eDpqiTA/cSMJ5NzqoYcWhx3JT8p+HKPdsjETMW+rq
 9xthHZj74j/nfLnxI3+pguX3GvwznTdZldov1+PBjzNAhZRPdbNWmC+1bTMxd99RGpzZmKQs
 H4JiqByB8hUVcnV/MBhaMMAA/mS4OuZMHXjiFpiBPEcG9mFpSbmJ9wKpWsuYR01boAfZTb1Y
 USVpRte5dlYO37sZLIfj2ON5yYCkfCI+TfNDKu8gj9yjn9ZLVDvwc2WTRTMt10BaWB1+U3FB
 b+VcNy3EVERArl9wTy9So81iOF1l3linDOIH8ykn3xLNIZyglbLFd/p13PQM4gEAF+s+l+9H
 yt3bZXblEUGDoUSnAGJqN5MfDjm0kTX9bit85cHLLTSSuaXMH05BLfQx68sYYpog8xoehTgo
 BmAtrtj4AOn3xXvd1/VAk2PnZuzBf6TW1pnZHJwVbtpslB/CbuSAFA3LctnIOd8qLI6kpaZj
 ZAtIq29PxiGcRyfkxx1UHU3hNUKmM2DiV3cMiy7TiI4epI8FQXF9sW9Llnk7iARAC2tuY0zp
 qDm1w+dSIdaH1ZuC8PfafSOyVKtvCFDxrwvARSXe4ZeKBf27YxnCy3tlftpccsCHhX0wGfI3
 QihHkZKrObAlIY57d3ViP3WtIyuCeZ/QBZXEjCDv7a7PCXX5ES5xopEXLradDzRTjqkqq64b
 PpbyOvwdvACgRBLv8x1Du8zn6454tLuoZ5czxhlRSuVMQn1Vew5fXTfhJtBrKxAwLNdqDCaY
 EPX94kII6iNNePkDEUVelgvYNOD4vdIyDPc2utkckz16Rh+8KeDTUgPbQKHjzZQLeUpPY4on
 bUhtcoR51DtgxYmKIzd3CpV63/KJWYJTKsgrJ1cDYr2zAsnjFhfOMSOBijz6ZCJStNNLkhzf
 GHK2fSd2O0DyxqQaWc3GFjMwfFZ28YEtidK+1ledV6HrcWU1PY40SpY/SkzUgkInA5M1Ph+O
 zY3OkApd7+C+Sxk2JpKU2y2QFsTWkXcoBCrjgFZ0TeFEw+zSmXRLWZ7Jf6C/QYS9GcadyUCp
 OOUz2PsUDDLesDt33JsBxA49aO8FIN8pl/YhcSqP8WZBJ1mMzDrtan/N2MHpizuDd41mECa9
 /Jh+/x9aPOnOCMdy0Hh51J2CVjNpMi4GVF/
IronPort-HdrOrdr: A9a23:ECwytKPowo+vdsBcThGjsMiBIKoaSvp037BK7SpMoNJuA6+lfq
 eV7ZImPH7P+VEssBNJo7290cy7LU80mqQFg7X5UY3CYOCighrMEGgA1/qb/9SDIULDH4dmvM
 8KT0E9MqyVMbEQt6jHCWeDc+rIjOP3iZxBCorlvgxQpBlRGt5dBhlCe3qm+5JNNXN77UtQLu
 vg2vZ6
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 23 Nov 2022 09:58:36 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 2AMNSVEg1243385
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Wed, 23 Nov 2022 10:28:32 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 2AMNSVEg1243385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1669159713; bh=KEan47vpnAXbRqqL19I22fV6kAHd9Y+4fPSDL8L7nJI=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=mCdOifDiK7gOSb5YtcvU/jzyzHEN8myhJT4rIqE9nlIkSFaK8u0U7Tg4jUuZTcyzx
         Ro+u8hqxkk7l445X0aFy8t9zMLU3PgA8Q8+LWQM6IK/Gqt/tJj4kahF8udzg46Bkn+
         6tHC5PXGO2WiBxsmRw4gtJoD7hPpv4pIIqL5aYCRX1Yh09qlnCULXQ7KAZnXYK55dR
         C9k1wST/nt26GasziFUwqxZ74rnUKiug3GgEavsVIPzjKj1iIpHf+IUxd6xJpKwwy1
         o+CR7mNkXZFt/RAwX9ZxbZk/ZSZaDPtYtPHMyeHH4WZb7uXp5SxIF0TwVbuqVA2lgQ
         vm3Frd8JHBi/A==
Message-ID: <b1441faf2883a693f41439de7be0a96f60b76f05.camel@crawford.emu.id.au>
Subject: Re: [PATCH 1/1] hwmon: (it87) Automatic handling of ACPI resource
 failure
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date:   Wed, 23 Nov 2022 10:28:31 +1100
In-Reply-To: <20221122184328.GA553935@roeck-us.net>
References: <20221121025718.160667-1-frank@crawford.emu.id.au>
         <20221122184328.GA553935@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Wed, 23 Nov 2022 10:28:33 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On Tue, 2022-11-22 at 10:46 -0800, Guenter Roeck wrote:
> On Mon, Nov 21, 2022 at 01:57:18PM +1100, Frank Crawford wrote:
> > On some Gigabyte boards sensors are marked as ACPI regions but not
> > really handled by ACPI calls, as they return no data.
> > Most commonly this is seen on boards with multiple ITE chips.
> > In this case we just ignore the failure and continue on.
> >=20
> > This is effectively the same as the use of either
> > =A0=A0=A0 acpi_enforce_resources=3Dlax (kernel)
> > or
> > =A0=A0=A0 ignore_resource_conflict=3D1 (it87)
> > but set programatically.
> >=20
> > Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> > ---
>=20
> Sorry, I can not accept this patch. Ignoring resource conflicts
> may have unintentional side effects and _has_ to be explicitly
> requested by the user.

I do have two comments on that decision, firstly, for the bulk of the
boards listed I've dumped the ACPI tables and data and the conflicting
address ranges do nothing with ACPI.  It looks like Gigabyte planned to
implement WMI access, but stopped after developing some code for single
chipset boards, and just nulled out anything to do with boards with two
chips.  However, getting any information from Gigabyte about this is
impossible, as you know.

Secondly, unfortunately most users have no idea what the ACPI error
means, and just follow random comments on the Internet, which currently
is to set "acpi_enforce_resources=3Dlax" which is even more dangerous.=20
At least the recent addition of "ignore_resource_conflict=3D1" restricts
the issue to a known area, and this would take it one step further in
that we are just automating it for known "safe" boards.

However, if you are not willing to accept it, I'll just drop it there.
>=20
> Guenter

Regards
Frank
> >=20
