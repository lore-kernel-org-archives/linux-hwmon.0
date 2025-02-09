Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA7243379
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Feb 2025 01:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739064382; cv=none; b=JjrtF4uZB9g5OtUKn+CWax5wbcrHFRX236A3nar+X5JSWty2lCV+UVrX9Z9tpvXTrLbTGxmrCZpdidRypRQlUChudZLqCfiTd+8vtq9whX1CwWfav4fn6jUOWebfANqEDN/5ZwnUTSVeYcMMEIJQiLyRa4ulLV+bjn5YMv0WcFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739064382; c=relaxed/simple;
	bh=Kf0cBZsqnN6/s6VDJ428pppFF/4I4EFmHLIzIf8uqYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahWzMIyBlJO7MvPGhFs69XhzG8zXby2IEgL4ejmfzTZkwvUgJnHVVIlkWnegXd9LRxa/ejY96oQRfSkRghF086DP+84A2LNA3AtTNw4+3NpvyfGpodjwiSqefqJ/D6GxGMQZm5JG58kbbCizvALM4NdKs1qic2Ur3qL3whQVdE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=az3M/TBL; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="az3M/TBL"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f83a8afcbbso5154286a91.1
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Feb 2025 17:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739064379; x=1739669179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jXr/EgQxFiiQgYQjWzByWStH2GlzKIB6+2DmVyNh4yQ=;
        b=az3M/TBLr95YwN1xfvcl3LoIeKEgodLNc2mN6JQjkv6jq7P8ZgJ8HlWpLvwL5m0QcQ
         hB5v9bvRegYA/iPO8gpOifuBvCDLgoPFJ9i1juoFY08CHJl2yOLnmXj72QNs9QtOaZI2
         V3KzCFvqvFDXJKSARPD9TQHFVjSqBktFdkLboPvPuvyoAfDE4CHDLUXDd82a6N12kXu8
         KTf012511pwY+NR8fUr2sx6E4v+hxhlFhN/LxvO4KtyuvjrRADtNjnuA9aSxu6verZTn
         oCVr5NFwf2BYTIRDu0L/wSj4K9dnbe2306b7JW3sfTgrpaTi9bZG/m9zJfaQFUEsgsz+
         rSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739064379; x=1739669179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXr/EgQxFiiQgYQjWzByWStH2GlzKIB6+2DmVyNh4yQ=;
        b=c0RecKk+nKGv+67IO2L4YF7VTSSTrUUaPOszJgVKKdq09byaCNSiuqD7ga83WBCeW2
         cRO3IymXlhdo0/8PJxpWoUVRcjgyUdQI6iS7kIjZqi3gCUC2Kq+zQvskbqeNGYlOaA1u
         jAtpI/XDC2OJB0sNQBgszlzFXyWFpdQpiRnjU69W4Ia8U4qLtRN1KY0CJ9/zyQTs9ltY
         6nAv5pZdeczb3ANlPhvIErMgpaxZUWrRSbB/dJ1iNEpYRjfk1kHT86KgONAyRNPrhYKg
         2UcBBxrFtYfvs5d0SGVTULBQaADp/VJ5HTyAmkK4nuKVvJVD8KesmaOrYXOfVWxC/7UA
         SzNg==
X-Gm-Message-State: AOJu0YwOAIW8Dr2dyGB5etGtQxZgiYY+ZOrahVmGPWT7kbDprxtLw/Na
	fFyfL9MNr+pisZqQJRMCSWNQJo8WlqSgH6t/O0fnecDvjavTLX8RJ7STcA==
X-Gm-Gg: ASbGncsSCpKsHmaORPZQs3Nv2Y6q1WnM/IPfidIPkU7CYbM8a2V47tZBn4pYQubNAyD
	xUW3Qghi6YwRj5jTN8uiR1Qdvih212s+sUHvq17bksf5ogGKnH+mTIlNVOw0IUc5qB2PuK8+Qm5
	GhgxPE3xuN/hnIn4q6s9TBsgZPE3xVJiRU0IKjz06+Tj0Qj19FO6g/1gqdlz86vfMMCF6Y0u6Uy
	/05NSLSIRmXAm2T99G5/uL8znzx8b/wN7OI6sm/ForxEJ1IVL9joKEVjjx1kGA1QCGguyqVgOJH
	R5aW6IaBgaw04JMazye8FPe35og6
X-Google-Smtp-Source: AGHT+IGvn4gME1v9P01AtppO2EdVyE4uaH3KORXWJGhwDTPMTHPINBXKRQwSu9maP4URVbKbUFGW9A==
X-Received: by 2002:a17:90a:d2c3:b0:2fa:1c09:3cee with SMTP id 98e67ed59e1d1-2fa1c093d7emr14882307a91.9.1739064379508;
        Sat, 08 Feb 2025 17:26:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51ae35a55sm5381369a12.0.2025.02.08.17.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 17:26:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/8] hwmon: (pmbus/core) Various fixes and improvements
Date: Sat,  8 Feb 2025 17:26:09 -0800
Message-ID: <20250209012617.944499-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve debugfs code by improving its scalability and making it
unconditional. Use the new i2c_client debugfs directory to reduce
local code. To retain backward compatibility, link the old pmbus
debugfs directory to the i2c debugfs directory.

Report the CAPABILITY register content in debugfs if it is available.

Declare regulator notification function as void since its return value
is not used.

Last but not least, fix various checkpatch issues.

----------------------------------------------------------------
Guenter Roeck (8):
      hwmon: (pmbus/core) Fix various coding style issues
      hwmon: (pmbus/core) Use local debugfs variable in debugfs initialization
      hwmon: (pmbus/core) Use the new i2c_client debugfs directory
      hwmon: (pmbus/core) Make debugfs code unconditional
      hwmon: (pmbus/core) Declare regulator notification function as void
      hwmon: (pmbus/core) Optimize debugfs block data attribute initialization
      hwmon: (pmbus/core) Optimize debugfs status attribute initialization
      hwmon: (pmbus/core) Report content of CAPABILITY register in debugfs

 drivers/hwmon/pmbus/pmbus_core.c | 363 +++++++++++++++------------------------
 1 file changed, 142 insertions(+), 221 deletions(-)
