Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60068C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:13:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DCB020855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaG8ymVN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbfAQVNx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:13:53 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37930 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728383AbfAQVNx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:13:53 -0500
Received: by mail-pg1-f194.google.com with SMTP id g189so4984178pgc.5
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=5icdsp4n7jR0qSLgrNsjzcKj4HxVV7wXSUx784CHjUc=;
        b=EaG8ymVNHShQQGwC1xh9fvoNewPVxhXewUGiFmznkZ8ha+m281+wtojH8smIMOKFp3
         JDd51L7bH7bMKJ6RJGnfAkK/9MtUz6sk9hi5BrBJSYmPNlHFswjT47hz/zOxCatb8Sjg
         r31hAcF0BPAe3tWXlqz9Iscg8NQP3d7TrFwCzyYvf9puC7m9gfdEyK8yMuezOZVhty32
         G5x4EBOWCd4Fo4G7EcR3AqLVfpAlHZWsYdZKxUj57otDRRIExiHR2ZbO0EKj66yrG2x5
         LrW59VGLDL2Z48qwBRQw51LK5jIlA8XMy1Uul9WM1UlfcgtmkfF1SB0FJ1FluS0onDCY
         fdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=5icdsp4n7jR0qSLgrNsjzcKj4HxVV7wXSUx784CHjUc=;
        b=hKoXC6EDr2XEvUJurwq6aT/7Lc0h5U5uawklVi2ZY+SWWwF+44inCBo1d/J6PuEocM
         tdHPU66KR9rNleiZU52Lajyt02COECF91TEEZbRIpoo+MVkFE3mwqO6dBRjY4/DF4BBv
         8dsJSPsCUWmfP8RVL2ACPB9PCZPdpz7uCeUIrzXRor/aoIlzqbiAobV73y7LWAqG/z/h
         89/qDFsccEszkQTKfPtgEPsklY9IFL3miwsjvWbJeTIwl2aOuSPOHoB7TFHU1hWKc1eE
         ybUmms0e+r6dXVDIh1JWH8a9h2f8BeD579EavJzAdQEhJ/z2Vbdxy3E6s4+AA1ZM4zzy
         d+ng==
X-Gm-Message-State: AJcUukeXrL84rN77sC5ms+SCpTJQv2+IujhKvLZ+AwGvqtFltQHaqS44
        BdT8SLvOi10ZWwWrN/FVq8G56cE1
X-Google-Smtp-Source: ALg8bN4Bk4McAh6XYsxCD/tGALIwDjBr9fMlOybRp9c9g1RPotPFNbJzr++IqfN1SGjemvH7HqN/MA==
X-Received: by 2002:a62:220d:: with SMTP id i13mr16479725pfi.162.1547759632757;
        Thu, 17 Jan 2019 13:13:52 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z7sm2721469pga.6.2019.01.17.13.13.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:13:52 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 00/29] hwmon: Use permission specific SENSOR[_DEVICE]_ATTR
Date:   Thu, 17 Jan 2019 13:13:20 -0800
Message-Id: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the drivers with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch series does not introduce functional changes. It was verified
by compiling the old and new files and comparing text and data sizes.

Note that the conversion of DEVICE_ATTR to DEVICE_ATTR_{RO,RW} is not part
of this series.

This is the second of three patch sets with auto-converted drivers.
The remaining patches will be submitted shortly.
