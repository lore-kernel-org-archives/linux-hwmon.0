Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343896;
	b=N/KyYqGkIquOo3op64ajcP+iOiGKX3GrkX3FDn0ulbTtGnXhcTY+y/rdVyUOpBowhhrq
	 1NQ2hg5x4zctM4aSB67T0B0IyxJxhdJxnknltWCu55PH8J5uhHd+mLsS6SZ/1xVhbFNww
	 HJZyfzeFy01W7qLDoENdGG7UfaAP5GiCYfSjJxhDuhhvKxkGjPza7R1t9o9BLxk8nsssN
	 BDKUdjEYpXnGVRS4dERGjh9PtMOIfIRSt0kdOiIlgpgrsfkhG+LUCVtn49We2V+ertOpQ
	 Fl7R6Srh0iLYMNK2QcK1nrUEiO7EPbtl9bP4+tmn6M9ikL21aQNz43wJuMszdsIjdrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343896;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Pmm933fIc9TKQDco3Q+vmfaeRrJIn57BcrNsnRJf6/8=;
	b=s2N/9BBi9eACqTcdkVnBi9AYSY2s26Xq4VWQj+Y+zzL6qrdGlowXeDSA86MmlGCYxT4Q
	 jaEnaTozo/Xh3a/ezjAILWZPKkdptCgSTG4xNxBpkCkMZ9HzZUyJSt9m+i1YMxcX+/N9m
	 h2/itA1GyIqnPR7T9gMLYqGQ6GUy9Pag62u9CTYK1iQpeAcQZO6wIhb8Kd+vH8UfwG53V
	 L2rgDtIbkxMUeo7xVT/+Jz1OoNVZ/WyGxuTEIvxBy0DMcH9XgKxUPBQ6fWCuTqdSE+mn+
	 +jn4ZQm4EUor1AzaAisCR8Ci4W7qTaJgtaU4SYX0uXTaL6HLPuk9jWrvhrHL6xP+4Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kik.pw;
	spf=pass smtp.mailfrom=kik.pw;
	dkim=pass header.d=kik.pw header.i=@kik.pw header.a=rsa-sha256 header.s=key1 header.b=F9D6V5fP;
	arc=none smtp.remote-ip=91.218.175.51
Received: from mta0.migadu.com (out-51.mta0.migadu.com [91.218.175.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3F3606A321
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 20:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A3F3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kik.pw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kik.pw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kik.pw header.i=@kik.pw header.a=rsa-sha256 header.s=key1 header.b=F9D6V5fP
X-Envelope-To: linux-hwmon@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Pmm933fIc9TKQDco3Q+vmfaeRrJIn57BcrNsnRJf6/8=;
 c=simple/simple; d=kik.pw;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794343892; v=1; x=1794948692;
 b=F9D6V5fPxCutkCSzFAK5D6VA2F5ixsN9PEXq91RFrUDqIzt+XX3m+fwQm2tWLsiCbi9VBIMo
 uv2ZEw9n6964tDrQ35vFsyv2p55DnMfqHXmE8McB3o1Hw4xE0Qa7blP68nv1R57V+jnt3yPHEjT
 bxa6nOvokk9OOKW1JCEuZbfbPyl1T4OtF5TatsEBUrFHio7ghnIWqYKkyKeAalwTJnxx9Wn6ktT
 LAVSPEE7JAYhE5hIV6+Uswee0DpSn1G8Vgf+oC8/MD664RoEdrzw1oaFj370O7pWlN0w0r4xywH
 J4FnvWJnvcz5DDOvYS8SWLJD4gVjjT4IwaeSp9v6Wx2pg==
X-Envelope-To: linux-hwmon@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0847aaf9939602f1;
	Tue, 10 Nov 2026 20:51:32 +0000
X-Mizu-Trace-ID: 0847aaf9939602f1
X-Migadu-Flow: FLOW_OUT
From: Alwyn Kik <alwyn@kik.pw>
To: jdahlin@gmail.com
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net
Subject: Re: [PATCH 0/5] hwmon: (nct6683) Fan control for ASRock B850 Steel Legend WiFi
Date: Tue, 10 Nov 2026 21:51:28 +0100
Message-ID: <20261110205128.18197-1-alwyn@kik.pw>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260825092546.669450-1-jdahlin@gmail.com>
References: <20260825092546.669450-1-jdahlin@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Johan!

I have the same board in my system so I wanted to help out:
ASRock B850 Steel Legend WiFi, BIOS 4.10 (02/10/2026), NCT6686D EC
firmware 1.0 build 10/29/24.

Tested the whole series twice: on 05441d697f7f (7.4-rc1 + 132), and on
7.4-rc2, both without issues.

Patch 2/5 needed git am -3 because the docs changed in 04f4079ee61a
("hwmon: (nct6683) Add more MSI boards to list of tested boards").
The driver probes without force, and pwmN_enable reads 2 after probe.

Manual control works on CPU_FAN1/2, AIO_PUMP and CHA_FAN1/3 with
fanN tracking pwmN.
CHA_FAN2 is untested (fan cable too short) but by elimination it should
be fan5/pwm5.

Also tested patch 4/5; a fan in manual mode at pwm 255 went back to EC
control on rmmod. pwm6_enable read 2 after reload.

I didn't test suspend/resume, or the retry path in 1/5 (I never caught
a lost write).

Is a v2 planned with the requested changes? Happy to test it!

PS: this is my first time on the kernel mailing list, pointers welcome.

For the whole series:

Tested-by: Alwyn Kik <alwyn@kik.pw>
