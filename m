Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09E0C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 22:14:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9C6560F48
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 22:14:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhI3WPx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Sep 2021 18:15:53 -0400
Received: from mout.gmx.net ([212.227.15.15]:43357 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229644AbhI3WPw (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Sep 2021 18:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633040034;
        bh=MHewOkD+jce8+cArzxQmNojKOGLby/F4yfasEcEkkyc=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=JEnIqt5KVB5FykCUbvHHt7a1x/CmFKRalKjAiPH9ibsaLjXQysXZpkHLgRFUd4crN
         ekDCACaMuYsS38z9S9hWmEWop9vjsuwGTonN7EfijooEw9LGMabYGhDv23cuvIAr/1
         cJN2VUmLWPdN24EuQlyE8TBDbxA2QKVxofo3ljkE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.40] ([91.137.126.34]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5G9n-1mvoIB0hPh-011AgL; Fri, 01
 Oct 2021 00:13:54 +0200
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
From:   Armin Wolf <W_Armin@gmx.de>
Subject: i5k_amb temp_mid replacement
Message-ID: <7aaa2734-514d-3752-01f1-fe3895718f55@gmx.de>
Date:   Fri, 1 Oct 2021 00:13:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:d81SxwLXMWqZjwihDc77uy3b4b92NVknz1Q1bORh2qfl9sf4ERq
 n2ag9tvSex88GXCUvn5iDL8Kng7zLHs1mr9tz4vIM9MIWXVqDibS4VWWZ/PNnNPYATPc/pi
 E93Gr2oRLrc/dxOGC3+sE+R8UWD91YwX6kbnj9q1misrvZ9bWFLgGPbCdU0zoV9QVlnidF9
 6qq41UeebIJyXJ57ZyB9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H/OQBA0qJNQ=:yzCoPMeL/BVE78tIFmsNRu
 7jkFpsR6r3BSvxUMhKUSa8q+uyeLfkyaBlWquNvym/bsXFYJH8eWrznq29ipxx+QY65+23Tpz
 9FImxc7oXRZPBt00DbnesKd23KWwea0FAElpoHe0fbrg/u31vWNt2nxHbMqom5nOYPPh1Tj/v
 Pvk6DYdjPjsymPTPYMnjkqdx0aRs5ok215g3I9SssltXwmDtCZzpH5XTLTxI/lyBPhP/Hn/M9
 7ovvt/Rl+yYp6GHMMP0ahEm1yIahRptUZezs5ZfJUWuoZes3Gpuu1E1VLfJ9a8ZQJ1pwe7N7U
 WdbbQkHXVv8/8xcV/TkvUQbOzhq2M1BzvA39Sm4K8Ubr99weeQBH5C5+SHZE78Ek6mODpWqPB
 0cgazCWXBf1M0nmnfkxQ2NEYonAhu9/5vbYQpFw8WAf4d1umIFqvIHQ+8RR82TuPjU5p0llnG
 8y9rp9sAyE+gnyXS424Dp8tW5QXxAL0nUbpyDLqzFe4fNS0oV5TG71b6hMI7qpZkcdinFOVDL
 9MjH/hyMZIUyJxFxY1M93n1yDaYB/Z+pNPHwv5v+CQnsRujE5r8uxftcGciQgKUDkaaX4GW02
 OLQaKjpDZtssTmEpB6vuUme20GSzYpvLFSNnSiLzfOlBgMNmKnf5y4AefmZitQzXN4+cwZ4yE
 9S9+aTwGNnasJ5c/0oyWna8nutQTo4YzxRml6sUkTQ8kQQrzuZs7wb0xoWwFql22M+sKOVUNh
 ohtWguI+jf7ewiY/D5JfBftSE6rGkkwc6iC5LCUTVbTAAyGSeopx6SPwEk3bd2Q/0hVamYkOa
 Fxep4a2+/M9w4exOVHHaFRJN/GcEYnm0Lhd4JcRwiF4FgRUjXh+mOIr5GT0GZ+EO3RZPB+BoV
 NFFCEQw6qKCiEeAqMsDUbqmo78mpmQMzI5YqwJ0Lx1TnMmRXEQoK2jva4zoGGYml3UKex/Dz1
 6cM7PbH7Q+Z07nf/cHuxNzHYBqcj2Bv0H/Y9nb/kxdPNxJaieeHjYzNFy9qqY2RAQ38LqDPmJ
 vQV8W59ZpTE7WswOdcWWV8DzICC+Bosf/idMgM4M6HMVWn7DLahDUTimtt2K0ppdY95T6L8Fx
 Ncm9cL/tj26++I=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

while trying to convert i5k_temp to the new hwmon API to resolve
https://bugzilla.kernel.org/show_bug.cgi?id=3D208693,
i was asking myself whether or not temp_mid could be replaced with a
standard sysfs attribute?
Since afaik temp_mid and temp_max are both temperature limits, they
could potentially be replaced with
temp_max and temp_crit.

Armin Wolf.

