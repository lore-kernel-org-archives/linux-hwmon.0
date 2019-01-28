Return-Path: <SRS0=CT/L=QE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B9FC282C8
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jan 2019 17:02:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7BA5321741
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jan 2019 17:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDQX66lt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731636AbfA1RCD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Jan 2019 12:02:03 -0500
Received: from mail-it1-f181.google.com ([209.85.166.181]:40921 "EHLO
        mail-it1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730640AbfA1RCC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Jan 2019 12:02:02 -0500
Received: by mail-it1-f181.google.com with SMTP id h193so20368357ita.5
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Jan 2019 09:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jpfWpNmZpn9lbNCDu96xYig6rTmRejq12E9HGUK8Yvc=;
        b=JDQX66ltmY2XLiBvoPZ/+/SQLX9PvkH60GY0FAjVGSMZOEjM5GbU/4JC7ce6uMCFHQ
         VDJlq/eZMqJQnrWjoCURYxD2l1HjptnV0cF4au23lmdwBvcd5m9/SrCA7Z27s6G0QPIM
         0m8W2iL8RaIgZCNPGKf62cOC87Ob1cbc/fDD5B/BvtToHYD2Nf5JZlYvR/vhWiqYSFEd
         xrUZ4rP+m7H4pn1HJi8wfnqWAzJu+AK5a16FA3JoJcW75jUNxYGGF6PuMLpeMtlzmuwJ
         fLOYeuXEA9WmNyJ/2gjuevpVUsDORnUD3qEs4aCmU3jrK5BsckXvGhk5YDmtdmIuKexn
         UwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jpfWpNmZpn9lbNCDu96xYig6rTmRejq12E9HGUK8Yvc=;
        b=g7l+TtaDFb3CLtcOiqVW0Pz4bMkVCnjxuLVA013N7dnHUR31KeCJE7vRqWDgPGaSXS
         CPorqfaJMvgdAyg6pv9UQCS5gEocvbfeaPBJSM0e3Qyzzt7i0X6fZngtB956npfr2q5r
         HIXxjUDyYCKwpig25R+3wCFRkxsjr14s1Lews6OR89Cqzov93kcgP39n0cYAtKiZfgp6
         /UA2QxJrKWDu+9T1Co6KK1p2qK+MnHGfw71Hl0E6FbI4qYk1lXWUTE0YfjS5cr4lbCSZ
         5IPxhJTV0w+N5RNix9EgUcIT5zDxR8ux8A1VMCB3A64Cegr0fww8bcYL8+NYXQq1Novw
         sDzA==
X-Gm-Message-State: AJcUukdKkr997FovGzeiwyhlPGX8SlQqWCdDa7V/ubMSEocAkoyy4cSF
        Pqo5uU8Y81Z6uepKz91a6+0KCI0O
X-Google-Smtp-Source: ALg8bN7AoDnegIOSQh6l1QGIl+r54nbhasxO2p9/ZykGXnkLvLAEaechFrZdURkdP3Mqcn9Lcba/Cg==
X-Received: by 2002:a24:414c:: with SMTP id x73mr10169192ita.129.1548694921183;
        Mon, 28 Jan 2019 09:02:01 -0800 (PST)
Received: from localhost.localdomain ([24.114.84.177])
        by smtp.gmail.com with ESMTPSA id v74sm18331962ita.27.2019.01.28.09.01.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jan 2019 09:02:00 -0800 (PST)
From:   Matt Wilbur <wilburm@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Matt Wilbur <wilburm@gmail.com>
Subject: [PATCH 0/1] Fix swapped coeffs for LM5066 and LM5066i iin
Date:   Mon, 28 Jan 2019 12:00:33 -0500
Message-Id: <20190128170034.24348-1-wilburm@gmail.com>
X-Mailer: git-send-email 2.20.1.309.g16a465bc01
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

For the LM5066,

For CL=GND,  50 mV threshold && DEVICE_SETUP[4] == 0
For CL=VDD, 26 mV threshold && DEVICE_SETUP[4] == 1

(from Section 8.3.1 and Table 31 of current datasheet)

And from Table 43 (I have reversed the rows of the datasheet to stay
consistent with your ordering):

CL = GND: m = 5405, b =-600, R - 2
CL = VDD:  m = 10753, b = -1200, R = -2

Combining the two statements:
DEVICE_SETUP[4] == 0: m = 5405, b =-600, R - 2
DEVICE_SETUP[4] == 1: m = 10753, b = -1200, R = -2

According to current code (again reversing the order to be consistent
with the above):

DEVICE_SETUP[4] == 0: use coeff[PSC_CURRENT_IN]
DEVICE_SETUP[4] == 1: use coeff[PSC_CURRENT_IN_L]

And for the lm5066 coefficient:

        [PSC_CURRENT_IN] = {
            .m = 10753,
            .R = -2,
        },
        [PSC_CURRENT_IN_L] = {
            .m = 5405,
            .R = -2,
        },

Again, combing the two:

DEVICE_SETUP[4] == 0: m = 10753, b = 0, R = -2
DEVICE_SETUP[4] == 1: m = 5405, b = 0, R = -2

which which is the opposite of the device datasheet (which I copy and
paste here):

DEVICE_SETUP[4] == 0: m = 5405, b =-600, R - 2
DEVICE_SETUP[4] == 1: m = 10753, b = -1200, R = -2


Matt Wilbur (1):
  Fix swapped coeffs for LM5066 and LM5066i iin

 drivers/hwmon/pmbus/lm25066.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.17.1

