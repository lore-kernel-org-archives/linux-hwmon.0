Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0D1560AAE
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084713; cv=none; b=E4lhV2QARJdmFEFGa1K3ioBW9du2DAxt51m6up9QocGY0k2T9sSQekORq520oFDSgK28g6JHYyiTom5uIgeyv5tzCEHmJ0DMK3x1jzxi+V4iTDWAxllcdpDWgppXdYBYkV0mS1sYvNk+RAoKYg4etw/MzRP+mIwrT5HjvWnEl4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084713; c=relaxed/simple;
	bh=I5Ur39HsqT6WeE3BnrxrMW7SOD/vom+1FTMZtowBYM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U5fU5iWjixuiC4a3uPTjlGp5yAjzhd/cAwlGjk51s7kxF/HEH2jQv6AQPXXxuJlD2PhMrmsaZ6UTgnVKNYkMbAI3Sc1AT3WtXLMLMrJja6rlKDdosaAGNMA0PE3uiBARq+qc2s+vFXddobnqf200IJ1C5i8QvjG59Ha2Ly6yTAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XS05rIck; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XS05rIck"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4a0280d4f3fso7936405e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084700; x=1792689500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUpuLMD6iQzc1bzNNihjv73gE3OjQ/PX0ITyufY5za8=;
        b=XS05rIckQK5HnuIE2EK4slHSDEgo/FSPmnqCMi6M9Rtys7FIEuoy88Dp6VHULu2pWt
         1yw4F5X/VwlJL4vuMATyiLlL92mB6lnrBNMvF3RZRMOTQYxpp4W1JsGx6/zmox6oD2dK
         9eSRGTjasU+VN+e4+rGSCMLC0qQmGU6KAk+Cg8VMOh6EBI5tSfYzl0H/m66HsEGHW0/Q
         NDixzerrQ68hlCkVmXZzq2vYDoO2lKkYQ47TrqJMRAM4sGvuQ0nFG5YHyygAhwYH/ex3
         Dv7EMgHcJ0D5jsL7JJ///Hd3z4VgCdMuLD7FkM0/gbpm1rlw1u8j4X+D883DmrxO2Yyv
         3b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084700; x=1792689500;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUpuLMD6iQzc1bzNNihjv73gE3OjQ/PX0ITyufY5za8=;
        b=u7R3LyM7XqSQbYo8w7emKjW4zEYWt2NDqv4/8dd6rpUzVkvuO08jyq3Ik9ZNmWWR8s
         kInly2ewXh1jTSWpVmCNLpTbPu6veOuFMvhUdVyZEj3u3EAZ3cw3OIl6Ude/iMNB0ww/
         Xvy8iGK2qGSspoUTDpjt7YvOcBD59isAF5F2FAaXr5RR2JUi4ONZdVp5AWOgij7b66sU
         BZi43Kkxiq049+HIx0zZSxsIcnRKBPU00qBX+j8kTDm9FkLfosub0GXshGt2GloB3aoV
         PmQ4yAcrPNijbZnE4iwawCL5iyF+1l+06pI3tl+E3ujDCB8Zok4OUGRIAcxK2Slkr6Y9
         SdJA==
X-Forwarded-Encrypted: i=1; AKwUvBxWoXA6M3Nbdv9OCnfA8N9qnsCJfZZqLsoXeylgRhfH56rf5T2tS2UgWfuzOKvHKidDVX9IQrD9IxRU2A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIRCzy+fXiJ0hhW7kVrbd0mjFtxsnGMGXjeVX/RNfTrpMq6IsOq
	BjhoypxCTWZH7Fc4Gy+AXNavdiYB+HqpyLjlatxv3gab9r9NcBBumc7W
X-Gm-Gg: AYBFou3ZY/OaRajnwIWj0J6GHBeSNMA/0EAZuKlu1zsGeG4ZBmPwI7G2naWNN461Fo5
	i7561NiejP9TXpliMOz41XQc2CKLfAtiRis7s4r/TAK3muD2BjIZjAOs/NGWZayRZJniMrGQPtt
	hBpTLSkJNbqLQIRHsIh7kK5fkNyjedZvgZfn0YmjIXQQc0xRJA9jTaVKEpCHuValL2YOqHjXxv8
	OM1nR5HosTxCrz3TGoWJ0S5Xi6Z+kRW+ZMdwJCI3qgLmlXQXkRRtaqWf87Zgw1UQDyMxBCV+Ha0
	YvJYkuF4HuNmPyQ6jNXggUdtrubsXqClcb6bNdaZ4Nd696Xa56RQNmZsSu53L7pao9iLYNsiSeH
	YHcrW43nbGBqDQFCPkxm5d3xMlHStU1Hq04N8f5zA1vpGXbC5OnofxPZE8/90P6jXKY7XYNQFYZ
	UdN4xmG/SriDb72f1A1FMEWJz1HznuM3qvmQiRzWvN9do9/RwWLwuwQPd00a9vk8A=
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a18e49881amr387691725e9.8.1792084700107;
        Thu, 15 Oct 2026 10:18:20 -0700 (PDT)
Received: from CachyOS ([176.88.124.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm123820185e9.10.2026.10.15.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:18:19 -0700 (PDT)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <ycistak@gmail.com>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <ycistak@gmail.com>
Subject: [PATCH] hwmon: (coretemp) Document sysfs numbering and label meaning
Date: Thu, 15 Oct 2026 20:17:59 +0300
Message-ID: <20261015171759.704526-1-ycistak@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The documentation says that all sysfs entries are named with their
core_id, and that the "Core X" label contains the processor number.
Neither is accurate. create_core_attrs() numbers the per-core
attributes core_id + 2 and always uses temp1 for the package sensor,
and show_label() prints topology_core_id(), not the logical CPU
number.

The difference is easy to see on hybrid CPUs. On an i7-14700F, the
"Core 4" label is on temp6 and belongs to CPUs 2 and 3, and the
E-cores report core IDs 32 to 43.

Describe the actual numbering.

The mismatch was found by an LLM comparing the documentation with the
code, and verified on the i7-14700F above.

Assisted-by: LLM
Signed-off-by: Asaf Nuri Bertizlioğlu <ycistak@gmail.com>
---

Notes:
    The LLM (Claude) also drafted the documentation change and this
    changelog. Values checked on my machine: temp6_label is "Core 4",
    cpu2 and cpu3 have core_id 4, temp1_label is "Package id 0".

 Documentation/hwmon/coretemp.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
index 34930168338..95b0a578c4d 100644
--- a/Documentation/hwmon/coretemp.rst
+++ b/Documentation/hwmon/coretemp.rst
@@ -46,7 +46,8 @@ mechanism will perform actions to forcibly cool down the processor. Alarm
 may be raised, if the temperature grows enough (more than TjMax) to trigger
 the Out-Of-Spec bit. The following table summarizes the exported sysfs files:
 
-All sysfs entries are named with their core_id (represented here by 'X').
+Per-core sysfs entries are numbered core_id + 2 (represented here by 'X').
+The package entries, if available, are always temp1_*.
 
 ================= ========================================================
 tempX_input	  Core temperature (in millidegrees Celsius).
@@ -55,9 +56,12 @@ tempX_max	  Maximum recommended operating temperature (Tcontrol).
 tempX_crit	  Maximum junction temperature (in millidegrees Celsius).
 tempX_crit_alarm  Set when Out-of-spec bit is set, never clears.
 		  Correct CPU operation is no longer guaranteed.
-tempX_label	  Contains string "Core X", where X is processor
-		  number. For Package temp, this will be "Package id Y",
-		  where Y is the package number.
+tempX_label	  Contains string "Core N", where N is the core_id
+		  (X - 2), as shown in
+		  /sys/devices/system/cpu/cpu*/topology/core_id. This
+		  is not the logical CPU number, and core_id values
+		  may be sparse. For Package temp, this will be
+		  "Package id Y", where Y is the package number.
 ================= ========================================================
 
 On modern CPUs (Nehalem and newer), TjMax is read from the
-- 
2.56.0

