Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E063329C48
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 05:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775023023; cv=pass; b=OESF98tXhGbWTclwN70sGgpKupm3WzH3ZrOi1MqzK+nLkgcBbpFlNEwS9I+fwGuHw39APnMWg0X7/c3LFfw0uqgLSpq2lUssxWma58BJm2HZF8NRz6uRHBvtfr/zDR8Tr3x+fIm/i12/Q8+yXMhHy486n/LqH6TK8XFrL1O1jks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775023023; c=relaxed/simple;
	bh=7txNJexjCPWa1ZjOiG6ln6fbKfDZniZJbvLtTe1ayEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LxtwjwH0g+F+54eYJLl/Eom7TTDM7eN51AfY74y7KYEbGed/aEIwQNt8epzaV7zE3R7BDNnBSLb2ysmvT7EakqwRS26vSPvH/MmWCo7jAF/BDkSJScxSYWTsTEP2nFgMPYDXUoRyvg2XF78OMYPES6Z8YUbvvP9/e+HC9pPgnPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7G+uELg; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7G+uELg"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b2503753efso25131655ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 22:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775023021; cv=none;
        d=google.com; s=arc-20240605;
        b=LW+123y1AvdWhra4FHuN6/po9CXOcYZF4uwjkm7tc/9BtV4KYLUtMRPty4CcQJ5Vzp
         cpu9WKR8XSr9QEarXjsXzKt3zXRE38p2yOjQuKl0ulTgZoadJiOGQ5dfJ9n2ee6MUB8p
         ThILUl3Nij9vLRaAA3Z19B/nCj5fL5bAJ/pSpvEx4vKYbuNWrLBdue0IeMKqHD4HXKf6
         TxWt8s4pS5xa2bJFAmtkAHJdKJ10s5HRdc6lhFOZsifCxew6u2kqxFNBg38de8+/XsP0
         uIvTteWiOPxK0PExNvr6MCS7T4ya1a5ZeB2tSaNWzeyXLBD/GAuJ4iikjC4Pgxcu6L2m
         HCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7txNJexjCPWa1ZjOiG6ln6fbKfDZniZJbvLtTe1ayEo=;
        fh=WlLwryTtV/JRe6b8mDAEGa2LcMI5Yib0UrXCE7x5Dy4=;
        b=YeqVgVbw0iKDvWApNwDZ4+NgwJ6GrqD0t9hAqQbZXI13s42w4/vm11MdnmoDER+51A
         7ZSgbyrStVFvvvqXd6OUVXoVHn2ndOg8agEiKP3lnsWOfA3F2Ymxi77b9PXSoRnK3jEh
         dJnW8upCSB4X9pNAP5ODJhHhd8cFI3nMemb6WzXP0y0yk0JBk5p/FArEFYBZYea+6EYL
         jLY+LN721A3Dz0X6Cpv4VRtgt96Ae1rq3bp+oiyQ7ZgJIimoJMvK+qX5DZBUU/hZQLV/
         MilBc2DhliuPk1+CXU+1ERdQVcIickTCHT8VylJ+JPl705PSytamd/16BCAuwnZXz9xV
         cNPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775023021; x=1775627821; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7txNJexjCPWa1ZjOiG6ln6fbKfDZniZJbvLtTe1ayEo=;
        b=p7G+uELgQmlrGof7klKKwX7f93W31QNH2JgV9qPhUJQD/k+dZ7jMAaA+DAmgOJNL3h
         htrigEc7+1qnYvEvGALG3SuwYa6JKbqhJrpD2vtdJwo+I3FFhvpByJagAVUB/oEh07zM
         Zb69FyiHQ0DqUOJRhQGd0bxm0TbNbkUKxCxCh6Z0kT9pWoXd8K09GjKZRbCfqdWgI/0p
         JbVMDRslBTKmmJtBdKn6ocYk8DszfpbuUb5eldDekJBc9YZ3QIe5fb5DzBV0dhzbhmld
         ndUTB9AUJ9G32LpL6TQVcgHDlLPR7zDVQtGjNAR2961a5aU3rYOiHqvvVseuu2fawQlS
         CakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775023021; x=1775627821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7txNJexjCPWa1ZjOiG6ln6fbKfDZniZJbvLtTe1ayEo=;
        b=IE8IyJPCVf6B6FcQqXbABDRkKoobome8CSxN5E4Gth/jjvMaBh6IbZ9hSVXQFnFWXw
         z7C64xbmKwDcgUXsCPSzkSU/LfIlfRtrypBzP1FEP4isQHudwCGleNGMFscRsxFcYLr3
         7l4hxk0DzjJDtlTS7Yk1/8lczPeJKq9PgzyBLvl81eFT6YdKZW9w2sjtUteOOlBqCm/y
         NSHWeyzYWhg3/6raQB/wV+uRy+7/BiCGel+S5T4sF646Ih0MM/fTp2AorExkzTxz1pcb
         HtQoqIPEzesD7mCntfZVJKy+SWQ0oe/JiZxlIgeFV219qQv9g47MMZdJTGJMMmAjVPHq
         WV+w==
X-Forwarded-Encrypted: i=1; AJvYcCUA3w7Rbazn/axpeQcIGLKFEft4q7B+7pDXx5M0pOH3RAz+1HllJWOthWe1wJkZ9NJIk3JY0L9msM+bYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvxZwGWn2ykwtPuHeWpHVIw9neQrbdX0vmBwrjUE5f4cLFATCx
	TQwLv7ioLepmLY4kVZEUdbhHUogs1AA+oqRjReu3eGI5KN3f89Tn9YxxhhqfcizqEksiYymA4WL
	4NG9JNDxQn6SZ235zxdydjUu4XMd7K1w=
X-Gm-Gg: ATEYQzxtPT+uKoIBYj7kP8MTV6mj6pP0sUQlaFma2hBEOEhWYYZVmS6jdH9jHtwl80I
	moRISivXpf3jXR3cQ/za4Fy0XveOeXzhXdKWx8ba0b7rH0zcyrSSlXvx1e/+sac9PvWsLZko7e+
	Anvi02C7JdLlPvA8l9HT3lahLIe6/0fMBlJKIbsERJELriN7vUrL4NnQQOjDkn7ir20h1/HY0u7
	YVlOnXDh9QAPY0XCswFCrKrJim8SXMjrU6chnKLV/F6EXtaLMCFsCBmQHvVJpzdCJpDPJo+HyK2
	Dp8PLBxmsLVdveUr415yZOMljVzbXo+UrmYpCw9N
X-Received: by 2002:a17:902:f609:b0:2b2:4e1a:aff9 with SMTP id
 d9443c01a7336-2b269d28befmr22131975ad.44.1775023021389; Tue, 31 Mar 2026
 22:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331215414.368785-1-bugfood-ml@fatooh.org> <6f1e43e0-14c0-40d7-ba43-95ece77d7176@roeck-us.net>
In-Reply-To: <6f1e43e0-14c0-40d7-ba43-95ece77d7176@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Wed, 1 Apr 2026 07:56:48 +0200
X-Gm-Features: AQROBzClXtVHtgh568BGaYCRwMattL4pFPZ124cmS_qNNIzbmWljYRHsOeoz9Lg
Message-ID: <CAB95QAS2-K4VADCveRfNCziYiBMJb-P7McQ3EFVznHqHBDx_MQ@mail.gmail.com>
Subject: Re: [PATCH v4] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
To: Guenter Roeck <linux@roeck-us.net>
Cc: Corey Hickey <bugfood-ml@fatooh.org>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Apr 2026 at 06:35, Guenter Roeck <linux@roeck-us.net> wrote:
>
> > Fixes: f7ac3020036b ("hwmon: (asus-ec-sensors) add ROG Crosshair X670E Gene.")
> > Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>

Should be:
Fixes: e0444758dd1b ("hwmon: (asus-ec-sensors) add PRIME X670E-PRO WIFI")

> Applied.

Maybe it is still possible to amend, please?

Eugene
