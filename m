Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1085C71145
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Aug 2023 09:03:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358888AbjHRJC5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Aug 2023 05:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358928AbjHRJCa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Aug 2023 05:02:30 -0400
X-Greylist: delayed 1477 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Aug 2023 02:02:05 PDT
Received: from mail.leachkin.pl (mail.leachkin.pl [217.61.97.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648F84230
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Aug 2023 02:02:05 -0700 (PDT)
Received: by mail.leachkin.pl (Postfix, from userid 1001)
        id 4556183CE4; Fri, 18 Aug 2023 09:16:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
        t=1692346561; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
        h=Date:From:To:Subject:From;
        b=jt6RPCuLubkNoo7KbjeG32uj45SbHQZFVNGs5ANxrWI6VQegi51Yb2dvGpbPtNNJo
         MJV4IWJwgiS143cfCXbNIiNLIStTG2kT/1Jl1RjX3C8MotFEoLnCJAaV0K920BO54a
         fpBDKwMcrwEXsuJf2bHSlgX2PdhvtiSFgM/gxmfT9INJyE+Bx/scQT2JeIM5eksv81
         Wi51qIQ8UMML6niteuqYGaWWsU8nt4K5OssdQGxzATHL5ArrWTSqgWjwxnV7Qob9kM
         YrhQyXw7K08vmBIf231l43b9yw3yteSDArBNehud9Z1GKnhilSBN1KdKV7PpVAMEgF
         OROCqd8BcEL9g==
Received: by mail.leachkin.pl for <linux-hwmon@vger.kernel.org>; Fri, 18 Aug 2023 08:15:51 GMT
Message-ID: <20230818074501-0.1.4u.ctrz.0.d3a1a999b5@leachkin.pl>
Date:   Fri, 18 Aug 2023 08:15:51 GMT
From:   "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To:     <linux-hwmon@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam,
Jakub Lemczak
