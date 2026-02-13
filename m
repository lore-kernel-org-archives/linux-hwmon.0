Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0B2261B71
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 06:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770965744; cv=none; b=ck5k9MoE8aD7dZ4E7hUm1rcElGNEJWO43j385PDNnRG2fvf5hjYlxYjnUN9Kkc752VlbGncn45mKA1DOAl1K38GuwO1jFMhfNgOTgLRytQuDRdoz+oxmtXu9QXihtY3D259MaJXYA/vzDMFwtKgIA5jes7NGc8oh9U7M943/R5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770965744; c=relaxed/simple;
	bh=tfRTUJkCc32g4iDhziQe0wsZk/tG/Cc4BR8eWbZn0V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mn36FTOLhdQhaYnqVtwfj9J134+/C8/y86vUCzbNHxfj+djlZaB7YAn6l20cfPhmxjTxSy+SwSQffDtb1OBe1ODQsmrnnylmpbQCcI88sF0ybQA4EN5hW08lFLhMaQRsQ1Des4dQ2HRGYqyH7/BZwu16vggnEuYEY0Adj/on4w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=O2k7g86B; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="O2k7g86B"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45f04f1348cso440420b6e.1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 22:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1770965742; x=1771570542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lubSrpyTaylapxsmwDf9p0k6fdzQ/YAegC4aSdF8hSg=;
        b=O2k7g86BP6SMg1IPQb90LzLnkeopKaf2vv7J8z7xH6jD1Y0vSp2FkG8Iwhd0mUPfsU
         wZyJnImdgT4S9YvDhc4XTHtQ71GvFIElVMTLgGvofLIOVKVwM1AKXNVpTPFDp2G/gayZ
         HSe2iZLHklb9KfUF5p1Xn7CTSDG5vebQeJhLat8dxAPmzBAMyAHiOfWEOi+hu5ehuwC+
         7Sh7zuspQqkdm7X6JWQyV+RVGyHeAjwbEVJI1f9oNQSKYxwU9aQlzjAlpx4l2jJjjg4v
         4DftfYWqPqCMxEa1InsfNt4G0QUWx07QrWGDN67QPV4TJFPZC9gNExaC3dx7sFB7fjWu
         h8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770965742; x=1771570542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lubSrpyTaylapxsmwDf9p0k6fdzQ/YAegC4aSdF8hSg=;
        b=nhX1WHzgqkvKu0FM8k6N/zOz1P4iI9rTHhnwNrJHsm7RBRg4avnFZ1b3YngtI9HKZT
         BoEdejh+4/WJRLQkzgeaDYeo/6g3S2GL2XK+PKCwhdVNA5AvojEmtexIa8fNf6ohIeM/
         aXvK6W1uNHxRn4h5FGAP4h0G/fGe5tmlYcuZmky8YsV69Sq3sP1mKUOGcJvKkupwse9N
         h2Qsl9fSRJ6KvFu0agV4OsAzGYaQgF7jiOdGLQZ6G9gDL9mdR3q0giw6eKxJHmDL9twb
         jtp5LSSrfp/DqMTILPY2pEC8BKIE1pNImiBgXDPJCwqg4Q5KlE7U99Sw/PSzqIeIeCD2
         DSkg==
X-Forwarded-Encrypted: i=1; AJvYcCXRg6eeIgzxDe0A/rYLkbYYIRrdCqZz+yUB23XxtfKmYMl21ElHouRlwxEXG5FKq+db4lYBTbD6s1aZUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt0/oXlf8g4Ij+0kbLHCEpa5ad4cV7vqcTW6C3DFnM4PFCa+5H
	HEKDcvpLQmQIczILLYiOLlHxdzk1a+4GixK/5hILL81uiKAU0wEGuoZVOqW4Habj9NQ=
X-Gm-Gg: AZuq6aIZ09352MjtKNovsAJ9bthZIAwvJmFK/KE0GuNUhb21r6Sw5UzJ8hibxj8PDoz
	xApmXBJO5tSLVLVTD0hALRQfd90ZWpYq0uEf+ezCtHRa29EepUVGwwIM2ighbhMep0EbxE0QAbi
	ksmoi9wlN4D6aMK15c4Y1FXfjUUENuV27oagDPTVswx1DCQDntfzOp4gdcBTRqVhLRslSjBOFWw
	olv7ngg3M+r6FFUfdE6rkcPRQTrnAYGcJMdm4ePCp/SRAdeqCAg9zVcmeD2NXJBAM5jMLZY0ra1
	EBPKs2vP1iC5nUi3p43E58F3fCyHAYuTwzq5uip9Wh9ms66Hlbxb6io9f9Xoh7rpUZQz8Vu3R3H
	kZYyFFMFmNjFchPfVa+bD0i12QcQQYjlyKGqUxvU7UsXiqOmQKY2K6VSBceAD0EKwNIiljFd07y
	SU6WuCCgmpez0+WYP9Ft+iSAytgzfKy5p4A7SISicss9l6/oy+KlkBNi/5pb6JrNFRxMtbmpUMB
	7h1cg==
X-Received: by 2002:a05:6808:f93:b0:45c:75ec:b9b3 with SMTP id 5614622812f47-4639eed169amr431269b6e.9.1770965741624;
        Thu, 12 Feb 2026 22:55:41 -0800 (PST)
Received: from localhost ([2001:470:b8f6:1b:a3ab:7352:1dc1:6b46])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-4636ae8f86fsm4200112b6e.3.2026.02.12.22.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 22:55:40 -0800 (PST)
From: Corey Minyard <corey@minyard.net>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Igor Raits <igor@gooddata.com>,
	linux-acpi@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Daniel Secik <daniel.secik@gooddata.com>,
	Zdenek Pesek <zdenek.pesek@gooddata.com>,
	Jiri Jurica <jiri.jurica@gooddata.com>,
	Huisong Li <lihuisong@huawei.com>,
	Corey Minyard <corey@minyard.net>
Subject: [PATCH 2/3] ipmi:msghandler: Handle error returns from the SMI sender
Date: Fri, 13 Feb 2026 00:52:14 -0600
Message-ID: <20260213065351.915707-3-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213065351.915707-1-corey@minyard.net>
References: <20260213065351.915707-1-corey@minyard.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It used to be, until recently, that the sender operation on the low
level interfaces would not fail.  That's not the case any more with
recent changes.

So check the return value from the sender operation, and propagate it
back up from there and handle the errors in all places.

Reported-by: Rafael J. Wysocki <rafael@kernel.org>
Fixes: bc3a9d217755 ("ipmi:si: Gracefully handle if the BMC is non-functional")
Signed-off-by: Corey Minyard <corey@minyard.net>
---
 drivers/char/ipmi/ipmi_msghandler.c | 97 +++++++++++++++++++----------
 1 file changed, 65 insertions(+), 32 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index a042b1596933..c209486bfee7 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -1887,19 +1887,32 @@ static struct ipmi_smi_msg *smi_add_send_msg(struct ipmi_smi *intf,
 	return smi_msg;
 }
 
-static void smi_send(struct ipmi_smi *intf,
+static int smi_send(struct ipmi_smi *intf,
 		     const struct ipmi_smi_handlers *handlers,
 		     struct ipmi_smi_msg *smi_msg, int priority)
 {
 	int run_to_completion = READ_ONCE(intf->run_to_completion);
 	unsigned long flags = 0;
+	int rv = 0;
 
 	ipmi_lock_xmit_msgs(intf, run_to_completion, &flags);
 	smi_msg = smi_add_send_msg(intf, smi_msg, priority);
 	ipmi_unlock_xmit_msgs(intf, run_to_completion, &flags);
 
-	if (smi_msg)
-		handlers->sender(intf->send_info, smi_msg);
+	if (smi_msg) {
+		rv = handlers->sender(intf->send_info, smi_msg);
+		if (rv) {
+			ipmi_lock_xmit_msgs(intf, run_to_completion, &flags);
+			intf->curr_msg = NULL;
+			ipmi_unlock_xmit_msgs(intf, run_to_completion, &flags);
+			/*
+			 * Something may have been added to the transmit
+			 * queue, so schedule a check for that.
+			 */
+			queue_work(system_wq, &intf->smi_work);
+		}
+	}
+	return rv;
 }
 
 static bool is_maintenance_mode_cmd(struct kernel_ipmi_msg *msg)
@@ -2312,6 +2325,7 @@ static int i_ipmi_request(struct ipmi_user     *user,
 	struct ipmi_recv_msg *recv_msg;
 	int run_to_completion = READ_ONCE(intf->run_to_completion);
 	int rv = 0;
+	bool in_seq_table = false;
 
 	if (supplied_recv) {
 		recv_msg = supplied_recv;
@@ -2365,33 +2379,47 @@ static int i_ipmi_request(struct ipmi_user     *user,
 		rv = i_ipmi_req_ipmb(intf, addr, msgid, msg, smi_msg, recv_msg,
 				     source_address, source_lun,
 				     retries, retry_time_ms);
+		in_seq_table = true;
 	} else if (is_ipmb_direct_addr(addr)) {
 		rv = i_ipmi_req_ipmb_direct(intf, addr, msgid, msg, smi_msg,
 					    recv_msg, source_lun);
 	} else if (is_lan_addr(addr)) {
 		rv = i_ipmi_req_lan(intf, addr, msgid, msg, smi_msg, recv_msg,
 				    source_lun, retries, retry_time_ms);
+		in_seq_table = true;
 	} else {
-	    /* Unknown address type. */
+		/* Unknown address type. */
 		ipmi_inc_stat(intf, sent_invalid_commands);
 		rv = -EINVAL;
 	}
 
-	if (rv) {
-out_err:
-		if (!supplied_smi)
-			ipmi_free_smi_msg(smi_msg);
-		if (!supplied_recv)
-			ipmi_free_recv_msg(recv_msg);
-	} else {
+	if (!rv) {
 		dev_dbg(intf->si_dev, "Send: %*ph\n",
 			smi_msg->data_size, smi_msg->data);
 
-		smi_send(intf, intf->handlers, smi_msg, priority);
+		rv = smi_send(intf, intf->handlers, smi_msg, priority);
+		if (rv && in_seq_table) {
+			/*
+			 * If it's in the sequence table, it will be
+			 * retried later, so ignore errors.
+			 */
+			rv = 0;
+			/* But we need to fix the timeout. */
+			intf_start_seq_timer(intf, smi_msg->msgid);
+			ipmi_free_smi_msg(smi_msg);
+			smi_msg = NULL;
+		}
 	}
+out_err:
 	if (!run_to_completion)
 		mutex_unlock(&intf->users_mutex);
 
+	if (rv) {
+		if (!supplied_smi)
+			ipmi_free_smi_msg(smi_msg);
+		if (!supplied_recv)
+			ipmi_free_recv_msg(recv_msg);
+	}
 	return rv;
 }
 
@@ -3965,12 +3993,12 @@ static int handle_ipmb_get_msg_cmd(struct ipmi_smi *intf,
 		dev_dbg(intf->si_dev, "Invalid command: %*ph\n",
 			msg->data_size, msg->data);
 
-		smi_send(intf, intf->handlers, msg, 0);
-		/*
-		 * We used the message, so return the value that
-		 * causes it to not be freed or queued.
-		 */
-		rv = -1;
+		if (smi_send(intf, intf->handlers, msg, 0) == IPMI_CC_NO_ERROR)
+			/*
+			 * We used the message, so return the value that
+			 * causes it to not be freed or queued.
+			 */
+			rv = -1;
 	} else if (!IS_ERR(recv_msg)) {
 		/* Extract the source address from the data. */
 		ipmb_addr = (struct ipmi_ipmb_addr *) &recv_msg->addr;
@@ -4044,12 +4072,12 @@ static int handle_ipmb_direct_rcv_cmd(struct ipmi_smi *intf,
 		msg->data[4] = IPMI_INVALID_CMD_COMPLETION_CODE;
 		msg->data_size = 5;
 
-		smi_send(intf, intf->handlers, msg, 0);
-		/*
-		 * We used the message, so return the value that
-		 * causes it to not be freed or queued.
-		 */
-		rv = -1;
+		if (smi_send(intf, intf->handlers, msg, 0) == IPMI_CC_NO_ERROR)
+			/*
+			 * We used the message, so return the value that
+			 * causes it to not be freed or queued.
+			 */
+			rv = -1;
 	} else if (!IS_ERR(recv_msg)) {
 		/* Extract the source address from the data. */
 		daddr = (struct ipmi_ipmb_direct_addr *)&recv_msg->addr;
@@ -4189,7 +4217,7 @@ static int handle_lan_get_msg_cmd(struct ipmi_smi *intf,
 				  struct ipmi_smi_msg *msg)
 {
 	struct cmd_rcvr          *rcvr;
-	int                      rv = 0;
+	int                      rv = 0; /* Free by default */
 	unsigned char            netfn;
 	unsigned char            cmd;
 	unsigned char            chan;
@@ -4242,12 +4270,12 @@ static int handle_lan_get_msg_cmd(struct ipmi_smi *intf,
 		dev_dbg(intf->si_dev, "Invalid command: %*ph\n",
 			msg->data_size, msg->data);
 
-		smi_send(intf, intf->handlers, msg, 0);
-		/*
-		 * We used the message, so return the value that
-		 * causes it to not be freed or queued.
-		 */
-		rv = -1;
+		if (smi_send(intf, intf->handlers, msg, 0) == IPMI_CC_NO_ERROR)
+			/*
+			 * We used the message, so return the value that
+			 * causes it to not be freed or queued.
+			 */
+			rv = -1;
 	} else if (!IS_ERR(recv_msg)) {
 		/* Extract the source address from the data. */
 		lan_addr = (struct ipmi_lan_addr *) &recv_msg->addr;
@@ -5056,7 +5084,12 @@ static void check_msg_timeout(struct ipmi_smi *intf, struct seq_table *ent,
 				ipmi_inc_stat(intf,
 					      retransmitted_ipmb_commands);
 
-			smi_send(intf, intf->handlers, smi_msg, 0);
+			/* If this fails we'll retry later or timeout. */
+			if (smi_send(intf, intf->handlers, smi_msg, 0) != IPMI_CC_NO_ERROR) {
+				/* But fix the timeout. */
+				intf_start_seq_timer(intf, smi_msg->msgid);
+				ipmi_free_smi_msg(smi_msg);
+			}
 		} else
 			ipmi_free_smi_msg(smi_msg);
 
-- 
2.43.0

