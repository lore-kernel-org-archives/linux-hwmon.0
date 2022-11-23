Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E91BC433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Nov 2022 02:43:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235602AbiKWCns (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Nov 2022 21:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235462AbiKWCns (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2022 21:43:48 -0500
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E21598C080
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 18:43:45 -0800 (PST)
IronPort-SDR: jWNTFJzVGevm7xHYDFK/AczIOdvB29vjxOTRAdbHysqJm4DByXZm2q/8yCv4x5Tsa2JyC20Rpg
 fXmMJsaEl2S8zmKKsjKM3Q5hVxUzCu9EO7Up3oMSFa6oFmArX2J3qoFQZAQSVNLSlJMmwCRwKa
 92BmNzGLJOeWHj4CvwCjGC2GuWClXp3orBtd29U08rgDFwzdD9wwSAGpTfTjLhG6QCiVNJf+nu
 t2pwFS9WZV+7J45ff1wbTmamniK6Tq5WhYakJS/07n8WAqJ0Y8KUO1Qgd2Vks4gqeGAfq7v6RP
 aHuOleke+sXZn6MCk7XhoXXj
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AaCQCoh31jjPQc8jxaHQEBAQEJARIBBQUBQAmBRoItg?=
 =?us-ascii?q?lyVa58vDwEPAQFEBAEBhQUChQImOBMBAgQBAQEBAwIDAQEBAQEBAwEBBgEBA?=
 =?us-ascii?q?QEBAQYEFAEBAQE/GAE5BwtSBwtYBweBQQuBYRMLAzENhlQBAQEDQAEBNwEPC?=
 =?us-ascii?q?w4KLlcGgxCDI7BBgTSBAYIIAQEGgmGaZYFeCYFAkBZ6Qz+BToEVgQqCCBg+i?=
 =?us-ascii?q?wKYMzcDGSsdQAMLOzIKSRtYDgkfHA4XDQUGEgMgbAUKNw8oL2crHBsHgQwqK?=
 =?us-ascii?q?BUDBAQDAgYTAyICDSkxFAQpEw0rJ28JAgMiZQUDAwQoLAMJQAcWESQ8B1Y6A?=
 =?us-ascii?q?QQDAg8gOAYDCQMCJFZ1LhEVBQMLFSUIBUsECDkFBlMSAgoRAxIPBiRFDkg+O?=
 =?us-ascii?q?RYGJ0IBMQ4OFANegWkENYFxCjEwnV+CfgKiWaAOg3KBTp85gUSnVJc0p08CC?=
 =?us-ascii?q?gcWgXmBfk0fGYMiTwECAQEBDQECAQEDAQIBAQEJAQEBAY4dGYITjDhhOwIHC?=
 =?us-ascii?q?wEBAwmKYgEB?=
IronPort-PHdr: A9a23:zsNiNh+OXQPVwf9uWBXoyV9kXcBvk7/1IhVT4YAulLxJaKjl8pH/e
 k3To/xw3xfAR46O7fVChqLNtrz4H3YN5JGdvTUDaMlCWxNf25oflgByDJLaWR+ifqzhZXViT
 s9JDAANwg==
IronPort-Data: A9a23:CS53rawcFqQlJUO3IPh6t+cFwCrEfRIJ4+MujC+fZmUNrF6WrkUHx
 zMcCjqPPKyPa2umLotwbYW0pBhSusOExt9iHABoryxnQy8aoJfPX4STJRugbi7DdpHNQUs4t
 JsXNNWZIso/Z3KN/R3F3prJ9Ckkj/vULlbf5E8oHggrGGeInQ940UoLd9YR29Iu2Z7ja++0k
 YuaT/f3YTdJ5hYtWo4qw/LbwP9QlKyaVAMw5jTSstgW1LN2vyB94KM3fcldHVOhKmVnNrLSq
 9L48V2M1jixEyHBqz+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRYRQR8/ttmHozx+4
 M12kJvzbDwnApTBuL8HfAJJSiN3PoQTrdcrIVDn2SCS50fHb2CqyO9nE08xJ4Fe9+NqR2BCs
 /UFQNwPRk7bwbjqmvThGq822phLwMrDZevzvllu1zjfDt4tW5ncTaLQ6ZlV2Sp2h8wIFOu2i
 88xM2s0M02YOkMTUrsRILkSgsGFqXugST1diXa+i7g32XqD1QMkhdABN/KOIofaH58E9qqCn
 UrC/mLkElQaK9mYzxKb/X+2wOzChyX2XMQVDrLQ3vxmjVmNz3YeIAYLTlb9qv684ma6WtRCO
 2QO/Sclru0v7wqtQ8WVYvGjiCDc+0RAAZ8KQ6hgtF3L0bbd/weSQHQcQT8HY9sj8sYrLdA36
 rOXt8vSIDsslYabdUuQ1uyOgiijYCocLkZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJ9dfYn
 WviQM8W2eh7sCIb60mo1RWc2GLz/8Shohodv1iOBDr9sGuVcab8P+SVBU7nAeFoBbvxorOph
 2kIncWPhAzlJcvVzHTlrAklOry2r82CLSHcyWFmG5Q6nwlBFlb9JcUKvGs7fhcsaJpYPyT1a
 VPSskVN/JBSenCtaOl+fupd6vjGL4C8TbwJtdiONbKih6Sdkyfeo0lTiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymH5vnD+KFcuhk0v3uVZ7WJJzYelZWLdpRr5khJ5oXC2Pq
 b6zyuPQlUQAALSgCsUp2dBKfQ9bRZTEOXwGg5cPLb7ZeFsO9JAJF+feibInZ4F/malJ/tokD
 VnjMnK0PGHX3CWdQS3UMC8LVV8adconxZ7NFXB1YwrANrlKSdrH0ZrzgLNuJOR7qbYykqAoJ
 xTHEu3Zaslypv3802x1RfHAQEZKLXxHXCqCYHioZiYRZZllS1Cb89PoZFK/piIUBzW5stEy5
 bCly0XaTdwKWl06XsrRbfuuyXK3vGQcwbwsARaXc4UJI0i8opJ3LyHRj+MsJ59eIxv0xgyci
 1ScDyAH9LvErIIC+dXUgbyJ8tWyGOxkE0sEQ2TWtO7kNSTT8me575VHVeKEIWLUWG/uofXwb
 v9c0P/7KvFBkVNX9YtwVb92lPps69zqrr5c7wJlAHSSMQr1V+wxfiPd0JAW5KNXx7JftQ+nY
 W61+4FXaeeTJcfoMF8NPw57PO6N4vEjnGWA5/oCPxSo7SB6y7OLTEFOMkTekydaNrZ0bt8oz
 Op96s4b7wuz1kgjPtqc1HsG/WWQNToLSaw4uJYADMnmjxdty10EaIGFUn3655SGatNtNEg2I
 2bK2vSf2OUAnBHPIygpCHzA/etBnpBQ6hpE+181IQjbkNTyma5l1RJcxj07UwBJw0gVyOl0I
 GVqaRF4KPnc5Ttun8QfDWmgFxsaXk/HogmrlwFMzj2cFRX0EHfRJXE8MqCR5E8YtWlbe35S4
 ejAmmriVD/reuD33zczABA79aG8HIArrQCSytq6G8mlHoUhZWa3iKGZYztaohTqNso9mUnbq
 LQ45+13c6D6a3IdrqBT51N2DljMpM1o/FB/fMw=
IronPort-HdrOrdr: A9a23:5gKn168K5bCvzlVG7A5uk+AII+orL9Y04lQ7vn2ZKSY+TiVXrb
 HMoB19726TtN9xYgBGpTjjUJPsfZq4z/JICOYqTNWftWXd2VdAabsSiLcKoAeQYxEWlNQz6U
 4IScEXY+EYT2IK6foSizPXLz9P+rm6GeyT9J7jJ/gBd3AQV0h51XYHNu+EKDwLeOCYP+tCKH
 JMjvA32gadRQ==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 23 Nov 2022 13:13:43 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 2AN2ha961286701
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Wed, 23 Nov 2022 13:43:36 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 2AN2ha961286701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1669171416; bh=INXQ1Ft89S/8CmdKEnaIB0beoL6Na73oMM1wBRS8EE0=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=hB70MWaj5RXDM03JTvgdCvFx9srGpwqdfa8xPNDoZ05Bxq8lz5rN28hJ1LHIqlWIp
         pfv2C+LP7oNrLImAT4FtrKYh3sRdyv4f2tVARyX+dufzOG4cXvXMrxCVTzQ18QO1Sv
         2+W26w3U3uAOCztMduBLcB3yHYJJXm9oVH3nrdlnstKAY/0W3x0ibHjLF6HfsIxTPn
         /CQKjjESiBf3t0H6Z2N+kkLq/+m0J8mAkfA4BjriPBS8Hek/M5nQkLoEkxafZJl6Pj
         wCUdIbcIuTWqgfUzvPIbmjYFgVx0RGznRi7n49qBzM4ok5xWzad/XQhX69F1b5qdtS
         rBnXdvFNDrUwA==
Message-ID: <63f2ce82f56507fe9db8798461c1d3ef1eb08bcd.camel@crawford.emu.id.au>
Subject: Re: [PATCH 1/1] hwmon: (it87) Automatic handling of ACPI resource
 failure
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date:   Wed, 23 Nov 2022 13:43:35 +1100
In-Reply-To: <54770368-e8be-49b2-57d9-4946cc22f12d@roeck-us.net>
References: <20221121025718.160667-1-frank@crawford.emu.id.au>
         <20221122184328.GA553935@roeck-us.net>
         <b1441faf2883a693f41439de7be0a96f60b76f05.camel@crawford.emu.id.au>
         <54770368-e8be-49b2-57d9-4946cc22f12d@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Wed, 23 Nov 2022 13:43:36 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 2022-11-22 at 15:49 -0800, Guenter Roeck wrote:
> On 11/22/22 15:28, Frank Crawford wrote:
...
> That is exactly why I had added to flag in the out-of-tree driver.

What do you mean here?  Are you recommending that is should be take out
of there as well?
>=20
> > that we are just automating it for known "safe" boards.
> >=20
> > However, if you are not willing to accept it, I'll just drop it
> > there.
>=20
> Sorry, I'd rather live with 100 users mad with me for not permitting
> the patch than permitting it and having to deal with one user who
> ended up with broken hardware or random reboots. This _has_ to be a
> conscious decision made by users.

Yes, and I understand, and yes, that is your call.
>=20
> Also, ignoring ACPI resource conflicts always was and always will be
> risky.
> There is no such thing as a "known safe board". Who knows what
> Gigabyte
> is going to do in the next version of their BIOS.

I would suggest that the possibility of Gigabyte doing that is almost
zero.  From what I can tell they are not doing anything further with
the WMI method, which is where this come in, and even with some recent
single chip boards it no longer seems to be supported.  But that is a
different matter.  Unfortunately, they will just leave in the useless
stub that does nothing but causes ACPI errors.
>=20
> Guenter

Regards
Frank
