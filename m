Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35212C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17F7760FC1
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbhJUTIK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 15:08:10 -0400
Received: from mout.gmx.net ([212.227.15.15]:36109 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230267AbhJUTIJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 15:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634843136;
        bh=5EiLs9aM09VBamPZ2A4dd77uzNkryaDokP6wmBs8aY8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=KjH/NAJSk3XUSBooiGEhBeoy010TVQVvGzWoNp+v+MbuidCr8vw+Rb1s+A9PxVATD
         oc/CUF0uq2yXegSYQ00eOKK7bHwbKCQfjwalQoeeiz9CgywhkLVvvS0XapRzpHn8M4
         gEGHETLSkxIIHbbSwf1+z2ot/kiukWkX6Gw5vdzY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MYvY2-1m8qwJ3zVI-00UuLK; Thu, 21 Oct 2021 21:05:36 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 0/5] hwmon: (dell-smm) Miscellaneous Improvments
Date:   Thu, 21 Oct 2021 21:05:26 +0200
Message-Id: <20211021190531.17379-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7wstTwHiB1tbzVApQicuqcBfWsxYtefvU8l/JC6gzLLdEvwHjve
 P8+XFgZd75/C1/lRoKWuL9ga44vmhTUHOricfqKa305TRc62W4zUzSewD7ylBMzuHyh2JJb
 3hKnAOm3GxNjMK61PfXO3K16RFufmiBG9iWsD2XkeFgztPpMsHuLWq75L7ThF5h+OeC5y/f
 +jCVPkXXh0LJfU14jd/JQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lloir4qJD14=:jT9YrwaIqIN9smXz1hUVIF
 ucdyoO8bx1xr6MTzVoymtQwSrdOYONYdQb8F8fcBp73zZRkQIQ+5WHJZ8Nb7rUy12sSxQ5iPe
 cjVM9fegQ35Q/OIXw87TF6EUGInDx+WLUlSSYo/axbkHFBZwqJ3GoGsR5UwADZbpCcKwYVKKM
 Zc8Y6ZlKvZ9AtfDMl2WjdyWmypl6xjIHpAW2E8mFk24Cdbow/W8VS+onR+YNspdLTwUVvTvE5
 DOUaZunOQHiScce49GAhF1FPo+s/0SPFj4DoLbD0CGRkPdZfrqIcl9MeE/aJ2h0loYjT65ska
 7xoRr/f+3Bv5TT0e1j/CWALEhP9cj5V9Bzb4cRKgIQPY0sQsW/xNGxiEUrIZCvvDy25qgFeuE
 4LBvXSGcgFPEelYKZYAOO9MG5Zf3WoRQdUqeBoUjh1znp7aXbW4RIMpLy8G+vNX003mJwDDBE
 gels64RkBspe6MXp0x7oIGVdCp3M5IsWE3crLOcOE+CBpZlYaZ2GTqfPYYxAq9whTFvSysw91
 BMTrCIopeRObUAOOL9eHmYmuxG+PI2QlQ/grZ6QViRvq66l9X7ZNRe+CgGSqxnfbW5nQiw3ky
 ++2kqLWBjA4HLMAN9HJL1M+Or5jctlJ/wgwyvv1ynckpTnAWTSOZ1L8Q1Ae/eUNBNTCY50KHH
 synk0fm6r1LF04OQeVfNFP0q8yMKJFFF8lq8PfKcjDLoFZx0lz/eUHHRc1FCyh2iqW5aBku79
 v98JiVfjbRMp6SMUObU4vkSEwNA2gUDWPjqeW3kh3kP+CaB40b9WZa8joT/3tW8C5ynYOpbRt
 jMCOcI1aCBTmMyKpcO9ZXGPPuxR8Nulrpvk1MJjhJV8lcsvU3NETsw1FDVlldZiErhYRKcR3P
 jBj+rWx9dXHX5qpziiUDTt+nm11Hj71K124awRBdnWU/QjLAMNTrRwMO/A77/C0oq0C45vPbb
 fv1iLe4qpiCcabnG4PHKLX/q0qgedUYpjbFht9fXP2Q7Mlpgye0mT4uPovWwTLt5HvfHTUbSk
 PqHOMU3DHkhpjOLysOfZTZ4bIe7fBbzQyYDZkIc/Evm3SbAl+PEHSxBiR96jiG4F7/WK5aNG/
 zyvcLsLXlyHt4Q=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

This patch series contains various improvments to the
dell-smm-hwmon driver. The first patch is merely a cosmetic
change. The next two patches improve the ioctl handling
and have been tested with i8kutils (the only program using
this interface). The fourth patch adds some clarification
about i8k_config_data[], and the last patch
accelerates the setting of fan speed and has been tested as well
over the legacy interface and the hwmon sysfs interface.

Tested on a Dell Inspiron 3505, the Dell Latitude C600 is
currently out-of-service.
=2D--
Changes in v2:
- drop patch 4 and instead add a comment on when to use
i8k_config_data[]
- reword patch 5

Armin Wolf (5):
  hwmon: (dell-smm) Sort includes in alphabetical order
  hwmon: (dell-smm) Use strscpy_pad()
  hwmon: (dell-smm) Return -ENOIOCTLCMD instead of -EINVAL
  hwmon: (dell-smm) Add comment explaining usage of i8k_config_data[]
  hwmon: (dell-smm) Speed up setting of fan speed

 drivers/hwmon/dell-smm-hwmon.c | 40 +++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 15 deletions(-)

=2D-
2.20.1

