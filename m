Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D23EC61DA4
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Mar 2023 11:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjCMLHA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Mar 2023 07:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjCMLG6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Mar 2023 07:06:58 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 484EA3CE01
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Mar 2023 04:06:56 -0700 (PDT)
IronPort-SDR: 640f03cd_3onebtdFHx+HTwq19ATmyfkfII6yU75ZuvkwjKpZtvmVU+O
 W9wYKWVHwW9Mqer55reZKtYxHY0VG70nCAJ77Ag==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2ADAABTAw9kjPQc8jxaGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQAmBMgUBAQEBCwGCLYJPjHGJEZ1OgX4PAQ8BAUQEAQGFBQKFM?=
 =?us-ascii?q?yY0CQ4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEFAEBAQFARYVoDYZVA?=
 =?us-ascii?q?QEBAQIBQAEBNwEPCw4KLlcGAYMQgjojrjl4gTSBAYIIAQEGgmOaZ4FeCYFAA?=
 =?us-ascii?q?YxrF4M2ekI/gU6EDzA+hDeGTJgrCoE0dYEgDoE9gQYCCQIRa4ESCGuBfkECD?=
 =?us-ascii?q?WQLDnaBVwJSNwMZKx1AAws7Oj81FCNebS0REwUDCxUqRwQIOQYcNBECCA8SD?=
 =?us-ascii?q?wYmQw5CNzQTBlwBKQsOEQNPgUYEL4FaCgYBKCScLnxDgQFApAOgU4QEgVefX?=
 =?us-ascii?q?4FGgjeMZphcl2Ygp04CCgcWgWKCFU0fGYMiTwMZD44gGYITkVNhOwIHCwEBA?=
 =?us-ascii?q?wmLQwEB?=
IronPort-PHdr: A9a23:YjcGrRVMEbxVco8zBESndY+gyH7V8K3KAWYlg6HPw5pEc7i4uZ/4N
 VPR4u9hylLMQMPa57RNlrmeurrrDGoH55vJq3UeaNpWWhoClchTnhR1DsKJUx+kJffmPSBmQ
 5QQDQ039HviaRpeE56hD2A=
IronPort-Data: A9a23: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
 9wF53nsJVKk9/mFnwrICiCT2o+LHs/n+08=
IronPort-HdrOrdr: A9a23:7zLRuaHSWYPo1b7KpLqEPseALOsnbusQ8zAXPiBKIyC9vPbo9P
 xG+85rsyMc6QxhP03J+7i7VZVoJEmxyXcb2/hyAV7PZmjbUS6TXeRfBOjZskXd8k/FmdK1vJ
 0IG8ND4Z/LfDxHZK3BjjVQfexB/DDKytHQuQ9Qok0dNj2Cc5sQkTuREDzrbXGeWjM2eabRy6
 DsnPaudlKbCAkqUvg=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 13 Mar 2023 21:36:52 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 32DB6lQh489746
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 13 Mar 2023 22:06:47 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 32DB6lQh489746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1678705608; bh=thpeR7C6u5PvIwSJHHN/iDqgK66TLtKR7+/MbHlZCeM=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Hfuz6YUqUPkMyklwwZMJPaybgXMf3lwf1gZTI8edKMXqL1xS7OvjFl/69qLAl8nrd
         IH+788iMl5qIploQx8+OL3KZetGKFYbzyYNx/AbRQ1Lkrj2Sk0qOPQWI1kaPGVuqWo
         kL2TF65O7uX+sBrh1WJaYX8eqGGjSm1SmAyD9ZAqP35MyNRxUOS4P7lq0AXqQfBwWL
         nWykXniCs95mKMRFYmO8s3AXEVcb2ldcoeS8u17XB2tZcmPc+aAgKTDFfRbTo0Gps3
         0un5Gq3W2A0fL9l2H8MVHQwKgSZsUpZIuP7oCpF+084u2hBDi4UT/d93lURbGb4h6I
         Vx+u7gkq1qwjg==
Message-ID: <94fbde73aae0bf8de77918bfb89ca8e10582e4a2.camel@crawford.emu.id.au>
Subject: Re: [PATCH v1 2/3] hwmon (it87): Add scaling macro for recent ADC
 voltages
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
Date:   Mon, 13 Mar 2023 22:06:47 +1100
In-Reply-To: <0933980e-921d-1e0c-a0a2-b2b44a6882c0@roeck-us.net>
References: <20230312043137.1744885-1-frank@crawford.emu.id.au>
         <20230312043137.1744885-3-frank@crawford.emu.id.au>
         <0933980e-921d-1e0c-a0a2-b2b44a6882c0@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Mon, 13 Mar 2023 22:06:48 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, 2023-03-12 at 07:49 -0700, Guenter Roeck wrote:
> On 3/11/23 20:31, Frank Crawford wrote:
> > Generalise scaling to include all recent ADC values and match the
> > labels
> > for internal voltage sensor to match.
> >=20
> > This includes correction of an existing error for voltage scaling
> > for
> > chips that have 10.9mV ADCs, where scaling was not performed.
> >=20
>=20
> That is really two patches (one patch per logical change). The bug
> fix
> should be the first patch of the series so it can be backported
> to older kernels.

Okay, ignore this patch set and I'll resubmit them a totally separate
patches.

>=20
> In general please only introduce new code like the 11mv scaling
> together
> with code actually using it, or I can not apply it.

The minor problem with holding this off until it is actually used is
that the chipset that uses it also has a lot of other changes, related
to number of fans, etc, and I'm trying to introduce them all as small
increments.  Otherwise I will need to submit a big patch with lots of
unrelated pieces.

>=20
> Thanks,
> Guenter

Regards
Frank
>=20
