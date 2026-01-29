Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05B93559D2
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 17:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769709078; cv=none; b=GrGm/s/mRDkcgKOp2H4eq0CztW3eXoUmLJ0eLIuBhOAEIqcqAJfdBt4oRMKUcYV8R8OAOCP3keXv7Dip15oTCMxO1p8OkTIu5wKikC7axMvehYH/plBqJwIAotCFcYKCeYOLJE7jatfm1RZabRhv3nlLTwLdwZLzyUGcHNUZQUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769709078; c=relaxed/simple;
	bh=IibRHaQJIvV+56nUEz6wG7DDBMI2xnJsIYZbLLKGxbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j98bxBu+YJ4gMVh6UXWL765byEAaIpVER58yXdzTxU1A+Rn/9OAYzL8dFNVgxkbWWUUicJNgzGKop1NljEgLTiLyyMjslqSoq+1L6VZ1eYXv3zxVSv+oNjeDr6yjuv9ZgpENKmQ7TErdVjn/kN1EuVYx4wUk+dhswRNWfDd0hT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWrw8T6/; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWrw8T6/"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-124afd03fd1so1918197c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 09:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769709075; x=1770313875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xIE6MG8mIv0JAx+OaJfSsuczEGv9gCtisFR0R4I8Xg4=;
        b=YWrw8T6/WIavQmh3Z0Fg8uXgZ9JAjk86fMYx0YsjK757twdXzhuT2hJ3UPYJwZyFFl
         etRpUukYPLQQWEeow2Lvmpe9rHhn4TKUSzGBfunkbo7RYFIWUfd5rjwvUhgbuarFuSA+
         5bBBGzBo1H9jd+8Oj1LMnCuDIL9VAw+ffLsuN8bPv9XKiN0kkkcu4c/h5KpIHWgtROni
         jJ3ATK7g7Fcp+E6nLjw+B11n0GLbXFZY18BhUA4JL277+DtC5EGjRqJOrbI6w0BQBr49
         LKH5IDX2hVRoMtM8r05fEFMF+Rr9CMIBFuCnLcv+GE8z8icIevCb8eGTcZSA4siKjiUj
         J2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769709075; x=1770313875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIE6MG8mIv0JAx+OaJfSsuczEGv9gCtisFR0R4I8Xg4=;
        b=Cs4MZWx2pU9I1WAnidzpzz40sUf7rHp3I77egBloS/V1HhoX3VtbGFeQf0VULQsIIm
         aUYTyeovAZ0F+qamX9wYetMOXLIzONrOEVSc9L75XczMNs7YJjrCjEyG+j/aFSo8RVcA
         EOyBUpAyYpXuXO8JzXdhceMwAzK7s/093fU1K8ZTw++DscDFCQNjedPFhylKz10ei0F5
         dV3FgoRnftLZZHQoUKd0qdK1jxhrEm1yykrwvGx6r/+oUZAS/Nnb/sKaW1xP+2vCXu5n
         lhogLGnGelnwwYH9f+IORs6Qd8znw7m/XigK0MjxLEKGzJH7oj9Rdj2zgDysncIpLqHc
         w2cw==
X-Gm-Message-State: AOJu0YzXoImOUWQSJ+CAYbK/YatUEbXC6D8s/mpbtWBaVRWT7KIQO3Zq
	5g0bp2OD2wMtODzOUh4GKW75D6Ma7iqJctAJcXwAUiYbFDNBk652ZdE+Bf1u2F1l
X-Gm-Gg: AZuq6aK1tAy1EKNWJf2cmVWzln/6W+8dDQsSr+9V9GXPO2+PMUmk9elwUF7opZr6D84
	fEB6rsFRGsXPNwOYnT6YmxfA9Bdpnd5kvgX2ja6HAzT4uvmpEZgpqTOSgaHoaVqZpLLoohg5Zhs
	Eqb+R24j/Ym2qAZunkKrHCHK0nUH1kR7nGbhY8wwQ7ayneWWNIcM36TlxTC6fUNKrOY8Z0Xww6W
	9ZlJCHKlooG1ypfMxuxqE9sEKVXwfXBcHNQTlKS3G2TqWBr43hDyBkKHCOETa3I+gB2/JQd5ZF/
	530k2MmdDIH1x9nSnnKtD272WVowNq3Y2842EpMkafDUWX4fpHulLhBchxjTUELKAcmtTwQZ6xP
	fRQHz2odYk0PAmk7GYFBqHk/FY+98dLgQ7RbXQBL3YtzTKsYqFEUWdUN+/KWdCfzsMjp8AG9nZM
	G0e5vBn84HwJmMot0xoQN4UfXY
X-Received: by 2002:a05:7022:248f:b0:119:e56b:91da with SMTP id a92af1059eb24-125c0f8c82emr135681c88.11.1769709075229;
        Thu, 29 Jan 2026 09:51:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9de7febsm6893947c88.10.2026.01.29.09.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:51:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/2] hwmon: (macsmc) Various fixes hwmon driver
Date: Thu, 29 Jan 2026 09:51:09 -0800
Message-ID: <20260129175112.3751907-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nathan reported a problem with FIELD_PREP in the macmsc driver.
Repeated analysis using Gemini 3 exposed a number of additional problems.
This patch series fixes all identified problems.

----------------------------------------------------------------
Guenter Roeck (2):
      hwmon: (macsmc) Fix regressions in Apple Silicon SMC hwmon driver
      hwmon: (macsmc) Fix overflows, underflows, and sign extension

 drivers/hwmon/macsmc-hwmon.c | 51 ++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 25 deletions(-)
