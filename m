Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30290C7618E
	for <linux-hwmon@archiver.kernel.org>; Sat, 22 Apr 2023 01:55:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbjDVBzy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Apr 2023 21:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjDVBzx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Apr 2023 21:55:53 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6D7981719
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Apr 2023 18:55:49 -0700 (PDT)
IronPort-SDR: 64433ea3_PXHuIlImRV7WZxk4Emg/Bv7bF9k8faDk9TSGaDkdpfqU1gA
 U3DHutK43wCbPSYdFLDdjSWaNAhDhdGr7JHf4Wg==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2ACAAAtPUNkjPQc8jxaGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQFACYEyBAEBAQEBCwGCLYJPjG+JFwOYA4VZgX4PAQ8BA?=
 =?us-ascii?q?UQEAQGFBgKFPCY0CQ4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEFAEBA?=
 =?us-ascii?q?QFARYVoDYYDAQEBAQIBJxkBATcBDwsOCi5XBgGDEII6I6okeIEBM4EBgggBA?=
 =?us-ascii?q?QaCZJppgV4JgUEBh1J6hDyDTnpCP4FOhEA+aSaDNYZClh+BM3SBJ4ExgQQCC?=
 =?us-ascii?q?QIRa4EQCGl6eUACDWQLDnCBRYMYBAIUNA4MFwVCNwMZKx1AAws7Oj01FB9MI?=
 =?us-ascii?q?BOBXAQvgVYGASYkmAUIeoFXgRqjH4wvlDyECIFZn2GBRqd8LpdJIKI9OYRgA?=
 =?us-ascii?q?goHFoFjghVNHxmDIk8DGQ+OIBmCE5FRYz0CBwsBAQMJiGwHglIBAQ?=
IronPort-PHdr: A9a23:kNrilBcRyF34rPgELJQkru9PlGM/hYqcDmcuAtIPgbNSaeKo5Z39M
 kvF6bNgiUKPXImd4u8Xw+PMuPXmXmoNqY2ErGhEapFJUAMIzMQOygIsDJTXVkTyIKzmM3NqT
 p0QBlRvpinpOkMNR67D
IronPort-Data: A9a23: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
 cpYwHDrIxyt2dt8cI7/PBBgbTtPnZs2Hk41xH0=
IronPort-HdrOrdr: A9a23:XtwEe6GfSm9kjyWLpLqEOMeALOsnbusQ8zAXPiBKIyC9vPbo9P
 xG+85rsyMc6QxhP03J+7i7VZVoJEmxyXcb2/hyAV7PZmjbUS6TXeRfBOjZskXd8k/FmdK1vJ
 0IG8ND4Z/LfDxHZK3BjjVQfexB/DDKytHQuQ9Qok0dNj2Cc5sQkDuRFDzrbnGemzM2f6bQxf
 Knl7d6mwY=
X-Talos-CUID: 9a23:E5F5y2x2+yBY+rQKQrV4BgUYIvkCcFuExU71LmO7TjlSRuPJe1+PrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AQaYn6AyK4F2rb+bbSHU5WqCc8kKaqKf+AW0wg5Y?=
 =?us-ascii?q?rgpKZDBV0HBHE1GqxQoByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 22 Apr 2023 11:25:46 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 33M1tdaE2883468
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 22 Apr 2023 11:55:40 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 33M1tdaE2883468
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1682128540; bh=KrrptQm8fCqzxp8L71qaP3zXcchIvyZk5Nkh8HI58vY=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=BXWSz8qU7kildYmJ8RcDsZZHCgjhK6zDnpdRvnIWRHnGoASvvt98aZOscm8EM8qRV
         mdn5+qBUmW4IVxd0/HLmywcbUwrXvZwwQV5wHzAplOGYKPfAdW6FZ7AQNB7T8p4O4C
         h6yrf2s0xbMNFl4+wJw2TnQxNMoZbOZfAt3sv3MeoK2NqQnPuUAHzscDzVgg2dRfQa
         OpZHaB88GsfAPRQx7JC2ozUqErfuu9A+YE2IJEIojoCxd19gvzCodtWP8W30FIW5oe
         p2N/2yX8sV9KaWcarnXXGuQYAZVBb3GFcrPoOxZCm8hTkp33ICFlJU49oPYJnH7hnv
         F3sOFEC2XUIsg==
Message-ID: <e70ae5944d7bc45e64410954442ba3f8e64cca27.camel@crawford.emu.id.au>
Subject: Re: [bug report] hwmon: (it87) Test for error in it87_update_device
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     linux-hwmon@vger.kernel.org
Date:   Sat, 22 Apr 2023 11:55:39 +1000
In-Reply-To: <262b6016-5b50-4bf2-cf2d-a316bc5f81a7@roeck-us.net>
References: <112b38d0-54b5-435d-9ce6-250b8b0e78fb@kili.mountain>
         <262b6016-5b50-4bf2-cf2d-a316bc5f81a7@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 22 Apr 2023 11:55:40 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 2023-04-21 at 07:28 -0700, Guenter Roeck wrote:
> On 4/21/23 03:45, Dan Carpenter wrote:
> > Hello Frank Crawford,
> >=20
> > The patch 27302e7a46f5: "hwmon: (it87) Test for error in
> > it87_update_device" from Apr 16, 2023, leads to the following
> > Smatch
> > static checker warning:
> >=20
> > =A0=A0=A0=A0=A0=A0=A0=A0drivers/hwmon/it87.c:1147 show_temp_type()
> > =A0=A0=A0=A0=A0=A0=A0=A0error: 'data' dereferencing possible ERR_PTR()
> >=20
>=20
> I updated the original patch. No need to send a fix or new version.

Thanks for that Guenter.

>=20
> Thanks,
> Guenter

Regards
Frank
>=20
> > drivers/hwmon/it87.c
> > =A0=A0=A0=A0 1141 static ssize_t show_temp_type(struct device *dev, str=
uct
> > device_attribute *attr,
> > =A0=A0=A0=A0 1142=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 char *buf)
> > =A0=A0=A0=A0 1143 {
> > =A0=A0=A0=A0 1144=A0=A0=A0=A0=A0=A0=A0=A0 struct sensor_device_attribut=
e *sensor_attr =3D
> > to_sensor_dev_attr(attr);
> > =A0=A0=A0=A0 1145=A0=A0=A0=A0=A0=A0=A0=A0 int nr =3D sensor_attr->index=
;
> > =A0=A0=A0=A0 1146=A0=A0=A0=A0=A0=A0=A0=A0 struct it87_data *data =3D it=
87_update_device(dev);
> > --> 1147=A0=A0=A0=A0=A0=A0=A0=A0 u8 reg =3D data->sensor;=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 /* In case value
> > is updated while used */
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 ^^^^^^^^^^^^
> > =A0=A0=A0=A0 1148=A0=A0=A0=A0=A0=A0=A0=A0 u8 extra =3D data->extra;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 ^^^^^^^^^^^
> >=20
> > =A0=A0=A0=A0 1149
> > =A0=A0=A0=A0 1150=A0=A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(data))
> >=20
> > This new check happens too late.
> >=20
> > =A0=A0=A0=A0 1151=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retur=
n PTR_ERR(data);
> > =A0=A0=A0=A0 1152
> >=20
> > regards,
> > dan carpenter
>=20
