Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7BC2701CB
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 03:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778903587; cv=none; b=bZ8PC3AhlPLjQ1uIDtYXD8SzSRUBQXDAYFxV/mxFghPk52wwBdw8tHirOA8qbovotbhBuoOGDZa3TR3MInGBmhtXAgEoIf19UE/o6Mck7fTkmqhbiMqf34lwBeB3fq45Af6JYIIgr7NlUJkyu1dqJtgcRlnh6Ei2g9Gkve+k7Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778903587; c=relaxed/simple;
	bh=Zh88LsjdS8b82WS8dFjlxBtfxA5gFqlVa8xpNBjfh4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JC6IH5QPt6ZvlH4ZRkolPlXTsuPyXgGlDOOLaAEKUNoaszLOpXG090VjABB2WQNI/n0NU8WM/fGkgP9/deJfCZAt4M+CRXvUlz5wwbZlAfyA+6gcnPHlvhvef+HxKOQSkiEPNdDkrpNDKi+tmM2nQy8WQSi2DeNWs9V7SQWxNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxS98qsT; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxS98qsT"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c801912c903so196762a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 20:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778903585; x=1779508385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jS0vSk6bmPfIusfXr5IMosg02PohFsEnHMQvJ941g6k=;
        b=SxS98qsTuwHbGpb6DvVM4HlVu+HNsLYf/b4Nn6agt/VR+4b+z0MpagoLIwl/x0aaM6
         QxinH3PHQF3qYJ9FcPE5DmPPk3lW75aunb0FxWMOtm00KNbWt1KYA0di14kxGiGBfjhp
         SWjGmuT7Xq3mPRRvU1kCG4U6Cy6f7UqXOg0MYjb+NBw1MDDVXO3z3J9kOnHSJxuv1vKk
         zAwxfw+WcP7Gt6qhDrulv5Yj36DB6q7gOm+qLIpyZ41tWUlgSROGGBNLa6vuz7UoTpkE
         0FzwL33ENDdVmKssisGpvzqI3KTcK7GaKaX8eHaBqh+qFwCGgVeqcTdR5dbAA0jMgPYr
         x/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778903585; x=1779508385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jS0vSk6bmPfIusfXr5IMosg02PohFsEnHMQvJ941g6k=;
        b=OA6xhcFJVc6/PUkRDSh0aTaDE4TVuDLaHJQYhP3EoqpJN3LjQJl3wU6endBiBTmbml
         4E5YDLcr7XQ2nR4Yfx2l5ngOH6el+afI6+fVzdnaEfo5C71Rx5+bM1yLOB3fAU+kGirp
         iHaf3Y5qFmmfUOPVRAzLlrBuhrKYb8LxJirRcUAvZJTcYkCEjV9QIK83BpgOuJZREmS5
         vIWC2tPJ6+fKAAuyakoGcrV0RUI5RbL8lVxwJDUQz2KFLeGGHXm0osmnaC5zwkTtKwe0
         ez9U3PgdB5S/JUBKFvApijhYp1IxaTM62euWlGMfL+FvtYxDM68pX490snL6fYyN1Odq
         PtTw==
X-Forwarded-Encrypted: i=1; AFNElJ/gIT4MJE9h6Ufjp6LMjLmNhUNfoN/XF7AyCfRpjyH9txwMPou7DYWMI2+eyGTTa/i9tt9IcHAT74v8VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwLKezAYaJw4b1uKJMJiMDZL+X4HdftjeGksl6IRgtoO2B7U5a
	DWiYJZdjrOgkaMxkHTakJlvwDTAUAn8+waEA44qXs5J8ukjfJB2M2bav
X-Gm-Gg: Acq92OEV3Rzx5IvypXIv1Md+vmR/5jr3Acs9HVgDKAXZwtxqUZRhzymlMnJR5/lV3mN
	W8exoWNhaPHIBR/6tbLGk4U7dlL8UrSTtr/N3Q3LNQUon1i3ZFWANezpkLOB2WFkB2o7vkG3kSU
	Q6mpJT6++OP4rwfHIzR+mSBezt7R5anjjc+O4FpgeN1nCLe362tgRVY5jOOoov4nJTdLMDK7qMw
	q5tlVadZPyfEeLsG95bpQ/43FKniETuemtsxtmoxXWpzCGHh1tMQyjHRc2OoB8D4hxOkXz0M8c7
	a99XLyybQ7NkSDAhrzVsMs2dIVf0+J1E4A4y5drzg8kTck8WXwE9xZNR2PcVs4cWLtJvYE5Kzl3
	UzKjkZrZHP5vuZR56dXEcW+e+V1hfg0+wAS1lqZqXkqnmyEWOfdVetysVYIGESKpU16uGHjtEmb
	OwUK3W9efsVD+D31dYzDC63Fs/5xL8+NyOfF7EaNAJdiaJXbuA0pEQsGjPKrUqE+/l58J6HCrrY
	I/i9DN7u1ikKWNyEUY6KclwPqDFcF9JzLgmVy7W9bXESW8svhDOkYbXHz54PtQ=
X-Received: by 2002:a05:6a20:e293:b0:39f:a42:924c with SMTP id adf61e73a8af0-3b22eba1aa3mr7452542637.17.1778903585380;
        Fri, 15 May 2026 20:53:05 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-184-71.dynamic-ip.hinet.net. [1.170.184.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb121cd6sm6939008a12.30.2026.05.15.20.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 20:53:04 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: linux@roeck-us.net
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] Documentation: hwmon: adt7411: document supported sysfs attributes
Date: Sat, 16 May 2026 11:52:31 +0800
Message-ID: <20260516035245.1604-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adt7411 driver exposes additional standard hwmon attributes beyond
the ones currently listed in Documentation/hwmon/adt7411.rst.

Document voltage min/max/alarm attributes, temperature min/max and
min_alarm/max_alarm attributes, and the temp2_fault attribute for the
external temperature channel.

Also update the documentation to clarify that analog inputs in1 and in2
are not available when the external temperature sensor is enabled, and
remove the outdated statement claiming that external temperature support
and limit registers are unsupported.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/hwmon/adt7411.rst | 37 +++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/adt7411.rst b/Documentation/hwmon/adt7411.rst
index 57ad16fb216a..28b6f3cb6b86 100644
--- a/Documentation/hwmon/adt7411.rst
+++ b/Documentation/hwmon/adt7411.rst
@@ -30,11 +30,36 @@ Check the datasheet for details.
 sysfs-Interface
 ---------------
 
-================ =================
-in0_input	 vdd voltage input
-in[1-8]_input	 analog 1-8 input
-temp1_input	 temperature input
-================ =================
+================    =================================
+in0_input           vdd voltage input
+in0_min             vdd low limit
+in0_max             vdd high limit
+in0_alarm           vdd alarm
+in[1-8]_input       analog 1-8 input
+in[1-8]_min         analog input low limit
+in[1-8]_max         analog input high limit
+in[1-8]_alarm       analog input alarm
+temp1_input         internal temperature input
+temp1_min           internal temperature low limit
+temp1_max           internal temperature high limit
+temp1_min_alarm     internal temperature low alarm
+temp1_max_alarm     internal temperature high alarm
+================    =================================
+
+If the external temperature sensor is enabled, the following attributes are
+also available:
+
+================ ================================================
+temp2_input      external temperature input
+temp2_min        external temperature low limit
+temp2_max        external temperature high limit
+temp2_min_alarm  external temperature low alarm
+temp2_max_alarm  external temperature high alarm
+temp2_fault      external temperature sensor fault
+================ ================================================
+
+If the external temperature sensor is enabled, analog inputs in1 and in2 are
+not available.
 
 Besides standard interfaces, this driver adds (0 = off, 1 = on):
 
@@ -47,4 +72,4 @@ Besides standard interfaces, this driver adds (0 = off, 1 = on):
 Notes
 -----
 
-SPI, external temperature sensor and limit registers are not supported yet.
+SPI is not supported yet.
-- 
2.53.0

