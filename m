Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576D5C5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24B3420850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ar7flJhx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbfARRPG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:06 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45384 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728548AbfARRPG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:06 -0500
Received: by mail-pl1-f196.google.com with SMTP id a14so6603892plm.12
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=nteH58YC92+t0POnyOOx33xq0jw1VBqkjm6gPw0jvk4=;
        b=Ar7flJhxZjSVl76NPpT8Ij4N5b6K1kjEQEt0GZQnPSV9iZ1gzrna6d5ESmpT7zYgpq
         gDZ6dNx8nxzy91qdzbe5UUvom8aVloZ+CYKl+Vu2pYRVGaOdVdyXB/BL+ZlaWghoGFgP
         QgHqt1GIN8pso7Crl7L8XDjKDHLIdSUZC5bzL4YW+S8LSG6zuXc/Tan/GA2pJOnLaC4Q
         EFzkD63LAX2KOJw6V7t3IIGlbBeZ2Airxf56iVh+XgtoDiDbCfmHHDsSJ43FOQicrteh
         7bfDJrQRxu2xLzSKGLXygurSyRfYjLgoCTOGDMqQ7b4a+1tp8oG3cuoSQZYzLjkcRG9e
         3i0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=nteH58YC92+t0POnyOOx33xq0jw1VBqkjm6gPw0jvk4=;
        b=YIfR/lVvcpEMqS+/1Z/b6S1JRgRmWIv+6mu+AH+lI7i/X+TI8XR4eJG0T9CdDaA3pi
         MWw5ApFI537JihA1q47lV20ZWCmiATPR3PSQXcRS/j6jUQlOM65kBbakbeG7K9VlT8mA
         f/nz2jH6rwln2zTn2y3zC1ruaMc/2nks6/qerrlcIjiD2pwG4s+02Qj2HBwF3f+2hVee
         Fh5YNkl4YlVrAM7ysmMiEm944WRbQ7WoNgJwrx0xmNMtXGAIOBM1i9jHspHhjRZyCamn
         ya2FOqpI+xBZS9EOk/m+PvdbphlQdWdK/ZVMOPocmDdDVcojyjmRUWqvCQQPw1woiN3M
         kvnw==
X-Gm-Message-State: AJcUukd8nK/5VZg870Mu2khxc2LwIM37TSp44zhhEUd5Amf997Lb7UCj
        uxJhsXQXDpos+yvZ4fV9KeL9iI+u
X-Google-Smtp-Source: ALg8bN5GR/Tbp3jAIaQErCUqf7MLDwZKTQPlyTUPEfeu4s+mKZ2fhpY1K09vMAVRSv19/8UX7sy4mw==
X-Received: by 2002:a17:902:2:: with SMTP id 2mr20390771pla.228.1547831705615;
        Fri, 18 Jan 2019 09:15:05 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q199sm9727545pfc.97.2019.01.18.09.15.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:04 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 00/30] hwmon: Use permission specific SENSOR[_DEVICE]_ATTR
Date:   Fri, 18 Jan 2019 09:14:30 -0800
Message-Id: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
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

This is the final patch set with auto-converted drivers.
