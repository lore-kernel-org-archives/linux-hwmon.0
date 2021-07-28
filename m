Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F03C432BE
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:16:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0636560FED
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:16:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbhG1WQT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 18:16:19 -0400
Received: from mout.gmx.net ([212.227.15.15]:35655 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231982AbhG1WQT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 18:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627510560;
        bh=5bMzPjeyijVAj4wj9GMDCHQTmRHHiM1RekFoQNFxu6o=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=MEZjBinxGoNU7fpw6Kx7NmSoMMjbeYjEdfYb2yxsq7gSGune8ffSbSe155mMe1bnC
         cA1WNFP3Aas+6YJFrNuoy2AdL8TAmDXEWvQuDfYtMczDLAnv2cF7b7ME/DgXxyOl57
         RzCKk+AJW25oAKZfEOr5DUNDUwuGcxcR9mSFKydQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.190.212]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MIwzA-1mT9cQ04kM-00KTqD; Thu, 29 Jul 2021 00:16:00 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v7 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon registration api
Date:   Thu, 29 Jul 2021 00:15:51 +0200
Message-Id: <20210728221557.8891-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MG/3tgQikatThyr4zr3XnHsPnuPQHsIOQ3PHfiHP9gw6TlHp3iA
 5f96Eq6b2nDU4LlS6Y59TWHYhAPrXqK5TObFUOQuRES5Fxqj41o/feeOnzbMeAArJZsJRWC
 Pnv6tmUfk3OXAGrcAwPq8iBZa7ScQaU8uhHuNKPzxwh3YxqZxhwhKDZq+Xq+YmEy+kbkPMU
 5Tynm0Aq68KP0hra7UnTg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2ZPo5QcESbY=:F4+w9rep3CWMUDSxhiCwJ7
 2CPogw8nw4hTyyIjJrS8d0dFCdJxwnLqzMfWmm2h4OpUMVEJ+Kx4sSGUeIRDF+XrIcf+msjU6
 XbMB/yrCZ/mTKOlp7QIk12Mob8HbQVOniiNAVAynYVFRUEide4uPJmY8lq48jspRid2s1WlHc
 Am7KwhHEyZQuwYOoRqR/ntvSrO/EgBYchGqUwm9tZKIPO5CqaHJ2JZffVOmbJQu75iNgSAV97
 FMZUqGqjESyBozusyVoE4e35mVNzX/Ge9qA8rnyNk35x6NPqYlmw2duq5OEzQko2PM45fI8hH
 iLQO11AwPuWoLnzRXDO59zEtqx3eXHiUQnEDs5GF/NKxRNBqhssfgu47s1gUXCUNyfcRtj+Q8
 aH+FczR8VarTFXK9Ol1RFUm+tx+EKQfSHcpM+JhEZ0n4gkR5d4nfdntVA/UU5JriwOb37NBlc
 meixQ4yehzICUoHvIvQK6XkroasYoLhFsGYQZtOdMv36JM41GP4aTHwWU6SxsH8MUPpINjCbR
 3hJ9pU2d2eHKDmUl5/5yM5rzcmPJg5GKKOp5A9wcKkgKIiZ/TTo40tgC7G7zyRSvraW2bMv4Y
 z/kaZ/66FB8axq85fhKJekCjGFtZnEWv0szKYqXlgeQrh96axx4nqn8ohuH4lxnEEndir6NHX
 l5vO72svEY7wX1q17kGyEW2kxLH4dFYkpQ7wex3JLczU7StkJjhwigjb3IJe92gN1cXVCnOFn
 cqTHQR0kPuoOvClfHj3IEN0eBQyYCoyj07/SFphjKFMAm5W95VUwBGhBEjuJEcHrQg9RnwpZi
 zYdCU940kQdqpwrdA5hIdZu++Lo69zNoA5jF4mqiSgwHq0nlgBZcmJrGP6uItStdQxYd3O97s
 I8XOlLut5vWgb9wjrQZ+JIus6cYZx/LWt+quwpcwbFsyrjWxRWuwhj06dgvjQeUULkmI1BoxE
 jsoC//Lu83e+olgz7WAjhgfckDYMtNgr/5/fm+JJQvxenGPRONkUMYTsBaNjX74fY+anDxeG2
 hYnxTjwqFq+cZRnH2ytB9v+wIv3aj6cYMb4NxtIM+zrrc/KF9os3daRUXZG/KbQvQLON8Uaa9
 1O47EC9YKf//8hen49i6isqP1xrkThA/6g4
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

This patch series is converting the dell-smm-hwmon driver
to the new hwmon registration API. In order to do so,
it introduces a platform device in the first patch, and
applies some optimisations in the next three patches.
The switch to the new hwmon registration API is done in
the next patch. The last patch is fixing a small bug.

The caching of the fan/temp values was modified to better fit
the new hwmon API.

The patches work fine for my Dell Latitude C600, but i whould
appreciate someone testing the code on another model too.

Changes in v7:
- Add commit explaining why pwm1_enable has to be write-only

Changes in v6:
- Make pwm1_enable permissions write-only
- Do not test fan speed in dell_smm_is_visible()

Changes in v5:
- Fix checkpatch warning after patch 5/6
- Hide fanX_label if fan type calls are disallowed

Changes in v4:
- Make fan detection behave like before patch 5/6
- Update coverletter title

Changes in v3:
- Update description of patch 1/6 and remove empty change
- Let pwm1_enable remain write-only
- Include a small bugfix

Changes in v2:
- Fix coverletter title
- Update docs regarding pwm1_enable

Armin Wolf (6):
  hwmon: (dell-smm-hwmon) Use platform device
  hwmon: (dell-smm-hwmon) Mark functions as __init
  hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
  hwmon: (dell-smm-hwmon) Move variables into a driver private data
    structure
  hwmon: (dell-smm-hwmon) Convert to
    devm_hwmon_device_register_with_info()
  hwmon: (dell-smm-hwmon) Fix fan mutliplier detection for 3rd fan

 drivers/hwmon/dell-smm-hwmon.c | 853 ++++++++++++++++-----------------
 1 file changed, 425 insertions(+), 428 deletions(-)

=2D-
2.20.1

