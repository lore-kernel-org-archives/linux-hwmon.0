Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D35EC433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Apr 2022 21:14:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234701AbiD2VRq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Apr 2022 17:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234189AbiD2VRp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Apr 2022 17:17:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D89F0D3DAF
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Apr 2022 14:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651266864;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=nyt4ykn1QhR0YTgPdt1Y5HFsS6fBE+SgIfjhrvt9+bs=;
        b=XwzIWbv8ynJl1kt5jfJe9QFL92qubVeEa2jtidHUqQj8jokIzdcNDCJWyF4T4btICoTdkK
        7FPHlLVBDMsbUgHeM3I0xPdkxNmkbt1uW99DxIxlqXFRFLNf9Wmy55UEEqIil14cCLHLeX
        2v9Top7NC7iDrE9RNJgobLxJkyhS4vQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37--AYCXKXxNS-NpUo7Cg87pw-1; Fri, 29 Apr 2022 17:14:23 -0400
X-MC-Unique: -AYCXKXxNS-NpUo7Cg87pw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A7743C0F091;
        Fri, 29 Apr 2022 21:14:22 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.8.66])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B4573111DCF9;
        Fri, 29 Apr 2022 21:14:20 +0000 (UTC)
From:   Lyude Paul <lyude@redhat.com>
To:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH 0/2] Fix detection of 2nd fan on X1C9
Date:   Fri, 29 Apr 2022 17:14:16 -0400
Message-Id: <20220429211418.4546-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some recent changes broke detection of the second fan on the X1 Carbon
9th generation, so here's some patches to fix it.

Lyude Paul (2):
  platform/x86: thinkpad_acpi: Restore X1 Carbon 9th Gen dual fan quirk
  platform/x86: thinkpad_acpi: Don't probe 2nd fan if enabled by quirk

 drivers/platform/x86/thinkpad_acpi.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

-- 
2.35.1

