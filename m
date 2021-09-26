Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF793C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Sep 2021 22:11:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5F436108E
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Sep 2021 22:11:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhIZWMp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 26 Sep 2021 18:12:45 -0400
Received: from mout.gmx.net ([212.227.15.19]:47595 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230075AbhIZWMp (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Sep 2021 18:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1632694250;
        bh=xboA9ZzuG5Zzeg1Pdf6DgisfeDuX8gW8zVWt8h5ez6E=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=DPsKgIj5TB/H+AIxk6OC6rdvbBlfyVrp/RKOzNoDCNJAtX9j+78liFWPFADaMq/pj
         /vEm38H8z2MMUfD4DHZioXswO20YG3V4wKZnCE6+g45xqsTOqnrPftqVwDilLw/+VR
         08g0Cgr9EthchPEdLIA75jjqbh94BM1sp6bgxX8I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Ma24s-1mIQak1O4a-00Vw17; Mon, 27 Sep 2021 00:10:50 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 0/2] hwmon: (dell-smm) Support additional attributes
Date:   Mon, 27 Sep 2021 00:10:42 +0200
Message-Id: <20210926221044.14327-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Q0BpeS6ey8P8wz0qdvgQ/PS+pXY6Zcpwa8DA9IV4r0qNHafcO0n
 I3GvqmgiIiK/YbYy71H9/RsuYMZyf231QdA4Q2uFRrEpWcQexi5jKJfexFdxLU3q9RsbWD8
 aDc+fzuluLgsO2LOLS7R/kcpZpv6YOIDKv6IrvUu5E0SQ5fUwaHo4AyTIZKwfyrFr0i2L4X
 cNN0hU6jxoECvoxSkNxJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RQ/CJHPsreY=:QAqEexPkDWGZ1EbeGnQw5T
 Rk/HP9ojDY/n/3Wf5fFDTdwaHPhKRGD7EyED9wJnnwzmJ8qiLFB9MT+K4KiLc3f8MBskkcY7s
 2dICjZ3X0SgwdvhBpMknPxObzKaLTvTcVCel3eVd0fd9l+UuMwcHu/Af7SU9LkVvJ5KZc1J8B
 mEYEUA7SbnncwebqdHpvr9hC9qJ/YTr2GfzF+xA1l6YAC7JPjiYXcE0a7IOfi8qNytC9lAbhd
 FPdr6NceZ5h/QQRntc2BJ1Ke6jHGH8y8aNONuK55GdRlXlqmpTICBxykHIxgIg3CR4tBdQAIJ
 RGmghwD74/tIV8XSozfuEgFV7q74EKbTCeHrgYuO2+sWcdbd2RSFXpUzSIRCWEi9XelWhcz2B
 JKpAso2stFqUhDg+X5DZx6kaO6UdUDGLMXFy8+QC9URGVxgZTV8z7LeyaBphYBXOdo6BTHGRQ
 ZhxvpzSJ0SE4fp43zuPl0X5tSPxaQVUSFjSn8N9LquKCY4f2hK3y33nOdg7/UjplrRfjoCfpx
 wU5VKxw+YJpFxFCjfaFXxszmwry69MHSpKJgqLzajVDcPDScxN4kitkWmBvX77pO8bgSP0xIi
 dlXur7OKST9RBQ+iUr0vblXUL0vX+FChxVSgzihZMD3v3mwDYOKPhQIXld3eBhMu10QTjGw8V
 J3/7M/KaeGh69Ep5C8wDUVN+iSHzHSP4rINjKmYRltJkMsgwE1QtdRuLgLoDnqkLYR1vJwDqO
 O/r8MUoh8sjOSm+744LF1O7jvvLq1aRqpa47KS7VbwE0YslPe4s9euNfqaEK/jIaC40kvghtn
 LXmN0A75DCsU58iFmy67hY/YcoN9/72fuUIzkUg3ePhdr1enJayc0/zRWV2fQ7n8tquO5N3Yx
 /vB9ZVcaLw6nNwz/QGBeT3RkACOm6louZoLsEFEHv1ziL+9nv6Y3SG5lSvgZ6FINmYeXi7PD3
 7EQqp2hZ0lcmvB4Fw9sspY1mfifAg3r5CK83ciS1mrf4ytrbTHARGnHxvC9ywMBcOtpwUkA+y
 C+3oY71RgeoHeAPrKFvg1ojtK9KtMqu50DwGTsZNaNCZsXQAooonU5v433f4UE/7nqnnDZgXQ
 ksUUJrbaXcVIto=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

This patch series adds support for fanX_min, fanX_max and fanX_target.
A second patch also removes some unnecessary includes.

Both patches where tested on a Dell Inspiron 3505 and
a Dell Latitude C600.

Changes in v3:
- improve fanX_min/_max/_target detection logic

Changes in v2:
- update documentation
- prevent out-of-bounds read/write when module is loaded with
  custom fan_max value

Armin Wolf (2):
  hwmon: (dell-smm) Add support for fanX_min, fanX_max and fanX_target
  hwmon: (dell-smm) Remove unnecessary includes

 Documentation/hwmon/dell-smm-hwmon.rst |  3 ++
 drivers/hwmon/dell-smm-hwmon.c         | 63 ++++++++++++++++++++++----
 2 files changed, 58 insertions(+), 8 deletions(-)

=2D-
2.20.1

