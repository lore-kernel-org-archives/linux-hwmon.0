Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD923093A6
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 16:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777566054; cv=none; b=blKc0LP7n0thARDezDcTS0UkWfjGHnuxbH/oxiFE+3SJTLKUk8f7B/nOzO/xNIPz6PaHa3myc1dVYKPB285rfxyFlBB7Qr0PatB+GC22iRTB87PDkzwnNOkJ7fU+Tnr34l7ycl78de+unlsjfpQ4InHFtsl+5Mox2DiZgDXN/nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777566054; c=relaxed/simple;
	bh=XZtpnPUZVQZilWnFItSJEU1qF5UYzTjXp5fSrimiOJs=;
	h=Message-ID:Date:From:To:Subject; b=Yb6yklgBDQNnEQxxEKPUOOR/6ad8ZItXapNB++4tq9bDZW1+riCJfmQeJF676Un6pZG+I9LGGs19gijCvScY7HrvNgrwyhsJeyBokjBzCrW1b7Zara/vQzUQJsNuC6mu9vRFhavZDHgaKXQdak3h6lcsLRP3x54b/bjqNWu1n4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVwzmz6G; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVwzmz6G"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso736577b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 09:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777566053; x=1778170853; darn=vger.kernel.org;
        h=subject:to:from:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZtpnPUZVQZilWnFItSJEU1qF5UYzTjXp5fSrimiOJs=;
        b=RVwzmz6Gn5lw0mRBY2AtS2lFfDP/ZvBOragi9SJdPi9aWYEp4YTQpSGSbL+PVtPlNr
         kX3kYQhzVF+SwrO2MVYCcPNYIWHtns0NkoRBK3SNmmUg+NTxFzydpQuYV/Xgnn5uNbRy
         Aquk1GPST+9UxGxgUqbI8NN2Gc+u+BpSbZNWjDug1+0LDpdTDUOMYKhjlnrE8NYxpyzd
         8mqfjfpxqBbWiS5QiieWokYp+Q7fPIWCD7zhmFM1eTViaDTudBK4NoZw/wn0R1gRNb5p
         a4t4510yhOsHWM2UKS4CcTDyu7co5EC+e9ztmfO/thiOVjiHjo9JvPsvxHxeNamgiQ8y
         CJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777566053; x=1778170853;
        h=subject:to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XZtpnPUZVQZilWnFItSJEU1qF5UYzTjXp5fSrimiOJs=;
        b=mn33MLRZ7N16s5MnZDQpnpThHFCJ8DSSbOO/mXrTlk/BF67z9MIc9Q+reZg4DTypLe
         xaP9Uei/QC3EPJ6nevCqBJ5fL2tsXv4FurutL9Vju1i3FQigu/6mFuufsdttR5YRn8gg
         B6Bl/UYkytk4JmG5CFTtYZKOSloQPJzOSaae8+ppFMR43wn+i/dcx0KjLryXPv4pp3E1
         kkQckAhzwLa2YJnCiNLfVtASk0+Sb86bENa75/Ayz4hBuVfwwS/g8BDpqX37mNOx7Vbn
         w/YFkHTiiwFsqezher2zYuTqkQNigMPc5w/qQ+w4sIhQ4xMvfv0q2N2jOmAWKbiaheqg
         Ikag==
X-Gm-Message-State: AOJu0YyiSYHhwYejgjx5LDmKrSPqquEfpTc9E9Jblym5isLFHIKRRLO2
	Vuvmgvv5wuajujv/oxLHseJVUBYpsWc3wTOl3fnwPmCE90R1wMVTxxAnSDBs1r2gKgw=
X-Gm-Gg: AeBDieuZWYT+AAicuEKGWCqBr0vuO4nkUtcKQ5ZnyNin2CD1MWHCQdZY93hVuVF2JfT
	UlA8nGZsQQWQ3D0FQtTUdsrJXcN73nwioRk9vMy7SMp7rlpkrESVygYNlTNmw9rmF7zGJXFOTJb
	IWaFwsn+GQ+jyLpbZxtpHs+nqJ86gGapvtc9FctWo2POPdiOgW8pbMxAWHF94idQP13AXonk2VM
	62ZWvMB/r+yy46GQP2KfAV/8QWP8oYliQ7Afa2qJ+q9K519osOhbpEgjRE4PLFCVpNG3bGkYBZc
	Ge7j0a1Fr8bZKkuToQ32GPFntmQ1z9Wo7T4dun0gZyTgrGK5BeGKpC/6jgyhZ3T/eWnCBANKif7
	3X28yHyHIC2xo7dJmsumrX9op2RkhS5yCpDkVCo4+6SbBZmxk0Bv+PoGyxPwDkWZXGej+s9aOGn
	8O0GILXolSLLIHstDcnDfYGsqWqbkDcdQhFfXLTRYZonZSsONBL/CsYHuLbXRBWRcavHvZjiCSO
	E/5+wu5NDb/VWqyxG9iSiYKY55F6EAuxq2JzDpz
X-Received: by 2002:a05:6a00:2997:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-834fffbc5a3mr3028508b3a.8.1777566052861;
        Thu, 30 Apr 2026 09:20:52 -0700 (PDT)
Received: from localhost (ec2-35-87-127-182.us-west-2.compute.amazonaws.com. [35.87.127.182])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-835158312c5sm138498b3a.8.2026.04.30.09.20.52
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 09:20:52 -0700 (PDT)
Message-ID: <69f38164.050a0220.356cea.00da@mx.google.com>
Date: Thu, 30 Apr 2026 09:20:52 -0700 (PDT)
From: rbcuthvu@gmail.com
X-Google-Original-From: PayPal,LLC
To: linux-hwmon@vger.kernel.org
Subject: Quick Reminder: Payment Needed for Invoice #QZTPMXW91K
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Hi Premium,

We hope you’re enjoying your experience with PayPal,LLC. This is a friendly reminder that your subscription is scheduled to renew tomorrow.

Your selected plan, Virus scan Security (Premium Member), will automatically renew for 1 year, and a total of 478.95 USD will be charged to your saved payment method.

Subscription Details

Plan: Virus scan Security (Premium Member)
Billing Term: 1 Year
Renewal Date: 2026-04-30
Payment Method: Saved Card
Amount: 478.95 USD

What You Need to Know

Your service will continue without interruption, and no action is required if you wish to keep your subscription active.

If you would like to cancel, update your plan, or make any changes, please contact us before the end of the day today to avoid the renewal charge.

Need Assistance?

Our support team is here to help with any questions, billing concerns, or account updates. Please feel free to reach out:

📞 802-278-0978

Important Reminder

For your security, PayPal,LLC will never ask for sensitive information or request payments outside of official channels. Always verify communications before taking action.

Thank you for being a valued customer of PayPal,LLC. We appreciate your continued trust and support.

— PayPal,LLC Team
