Return-Path: <SRS0=10GT=AO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C8EC433E0
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Jul 2020 16:03:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 566622070B
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Jul 2020 16:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="HdrJD0Wo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgGCQD2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 Jul 2020 12:03:28 -0400
Received: from mout.gmx.net ([212.227.15.15]:47137 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgGCQD1 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 3 Jul 2020 12:03:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1593792206;
        bh=NEG0WksfHj7Vv+zOdRUdELdOi70nhjOXQtEb7jBh2L0=;
        h=X-UI-Sender-Class:Subject:From:To:Date;
        b=HdrJD0Wom3r57A3VdVx1l3rIM9p9ZgryohEjzf2cATisk+bHlCti7EJiMiGd69Jnx
         tDMBOeQ5SYZ2xjZU1Bjp9p10cX8QpeckrGZ8E8dM/h1e5p4u0xPvmxGrrOnratZwBA
         3xA5BH6VTUQPFcgz+p+Zt4FA8QD1T+/aLxyUd9iM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.2] ([84.190.128.236]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8QS2-1jmyJa1sLg-004QiK for
 <linux-hwmon@vger.kernel.org>; Fri, 03 Jul 2020 18:03:26 +0200
Message-ID: <66053ce744dafbad6925df53b6ef2db1e2859740.camel@gmx.de>
Subject: hwmon (nct6775): Please fix Invalid temperature source error for
 NCT6798D
From:   Stefan Dietrich <roots@gmx.de>
To:     linux-hwmon@vger.kernel.org
Date:   Fri, 03 Jul 2020 18:03:26 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:u1HAZi9KHM7/+tghgdomnXIdOl/lQPnRyuIdJvCmA97aYytRLI+
 yy+H95X+LMMF8Kg63esXTKkk5SCx+LhctZkxOogjiUYWtvQpxRl5HxWkC3zbHu/dg5hMGIh
 /UNDlFYJXhoYxYIsGToIOb8i238/qs4V7of2QnW7H2cgaYCPyxZZrja9GsjWLkf7QltGe5i
 uu8OajLqOMxxhnic22KMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fQcKSYmBjeg=:VXJoFPIhY/1I61C1/pwZDd
 ZXCihPuFogIooBTqdQRENhD24Mv6aEjJ6wK1tPsn/GUQ1QYjDSY/KNb2t5811Q8SQ6fOUvqlR
 sRGIbnzhFhPOHhM2y8HSh68nqzSchGE7fmJe++Fo6BvVRUCBcBb6PgB/+pUtXIhOIniiCOldh
 l3K8eS5Xjm1zZUYkHIAWzP25AOiXCOOleG9SnqfMo1K3gnObC9eLRyEkqcgJpNF3nD+33dRem
 nrouezy+b/u/+iMjyIGrcqpSVz8pCiVEjcNC4+zs5rn9OqhUNEQ1hClxfL4IOB/O5eb3mZ6mZ
 cuxwNSshmfAKjl4r7J2vFRxyhdDLU2hmOYlacOBam6LtDzo7XApN/44UxrxSfabgX8AVJSz4e
 HK/OrIchFXueJFid9VEyrEIysYC2Txnh8rj2VaBFUbXanB/9tRKyCRkShfEvOzHVn3lbuDSUc
 7MZAWNN8D0k/U6JlDO7N8zWHMJmm8n0KjQSHj8mwn7y8GNXTDnbB89JdJZv8FL0vMZ6F+FaU7
 I3ioY/G4yDA4iflm9vmmOWjFmE6JDi6lGkAmviaYMIOM2+p+FMWjrCcvWYXxFQS5Y/U4CP3ar
 6/JqatU85F6gVelpGFMLyywqqxkBTHvdTokddmfNTEBFIN3oCCEd/56j6ia+dG6odMzRgJWIz
 6gTiBJZSnC3CnbmmD1RbUWOT/y5ck7pGw2a+vf66Zem6vrhgctfrARy2WT6IqQFRoKuCoGqt1
 EV0NhcF5RJuYsJZyva0cuT6FPykLRxCzNT2Ll5aNz/0qCxmPW8N3VZkvlFLXup/yPfNemAsoU
 oGsVV7OaMq21YCtF81EMb1NBqfYW7pprl4rs0wIcY257gP6d7ConmsbyD3gU9njTmMKr3lo8N
 iIrvGTlL/0Nk44YvCgsbQ8NkK6ayKTnOkYvmLqQV18sL0JN7zw5+SdEm60IU2Ea+sGfUxhIxJ
 UoSuKIG4gcQy3cgPk5XJiW5pphNBC+tNGYuEyKwA7TzZ4QfqtJQwJjDVJX4qokvNhZB5rP5z3
 DkYqNsqUwfHThiOvENh/wz/TnU/nLdT8NFCn7hU08UJYxGZQWP5zUIHOmFkH6ElVx5YyBPfAE
 DtuVfBUVTegHtxbXcH1/N4z7zzy5kOHgxWMSdv3sxQmWMmWbHd/LHjiPsM/EKggXE2BJ37TmM
 MncKcoFkUJbsRKpjafCF7/ueGGyHJHNW9kDptJYibedAarvZnieEC/3GIY7dfXw2Vrdl+7rhz
 Y2kp2zMqUAoY+SzxZ
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi all,

with my Asus Formula XII Z490 and 5.7.0-7.1-liquorix-amd64 I'm getting
the following error messages during boot:

nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
nct6775 nct6775.656: Invalid temperature source 28 at index 0, source
register 0x100, temp register 0x73
nct6775 nct6775.656: Invalid temperature source 28 at index 1, source
register 0x200, temp register 0x75
nct6775 nct6775.656: Invalid temperature source 28 at index 2, source
register 0x300, temp register 0x77
nct6775 nct6775.656: Invalid temperature source 28 at index 3, source
register 0x800, temp register 0x79
nct6775 nct6775.656: Invalid temperature source 28 at index 4, source
register 0x900, temp register 0x7b
nct6775 nct6775.656: Invalid temperature source 28 at index 5, source
register 0xa00, temp register 0x7d

During sensors-detect, most of the standard temperature, voltage and
rpm sources are recognized, however, some of the values, particularly
voltages, are off quite a bit. In addition, output of additional
temperature sensors (via headers on the mainboard) which are reported
fine in BIOS, are missing.

Booting with acpi_enforce_resources=lax doesn't solve this issue.

I'd be happy if anyone would be able to fix this issue or give any
pointers on how to do so. Unfortunately I only have very basic coding
skills, but I'll be happy to assist in debugging.


Cheers,
Stefan

