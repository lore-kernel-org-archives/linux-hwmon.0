Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F3372630
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 05:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788067180; cv=none; b=as/C22vBkKUtw7Yq+F+0nMqfuF0FreL098DAwnouluJlDoPywyPDGaaXCvuubQinRwscHGb98twj8k98Oj+wQ/qRuvwqtp2s+ZECwHxPBY56tYYo8j4ut92qHFYIbdOq/f+7xU6wu5n7E81iVuaF64uuLNPmpxA9VDSitTIY7OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788067180; c=relaxed/simple;
	bh=KX320XcpLk3Fm8Cgd8srfW2N5vYbERamWv5i8xvHSo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o/R45afeipYGAy6F4ZWXVko6HQHl3JvafL7/kAZQM082+XDUQD2TyLqbqfnJ5HzygyPFDFECRxCptn5sPjoaAWyeeEJEtA97nTs0XxcfXjKTSPalE8m1f0hzSm36S3Wq6bn4ddtmsDq1mHVYgo1m+sqF4TMoLSTCQSmZdfj4/tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieJ5Z7Jl; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieJ5Z7Jl"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c250c6a6a6eso295402266b.0
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 22:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788067177; x=1788671977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KX320XcpLk3Fm8Cgd8srfW2N5vYbERamWv5i8xvHSo0=;
        b=ieJ5Z7JlWnaC2xcTH6h5vJLlHIT6NffbxMQXsXoQUGtqEfcoulhD9uQpU26eV+bPIU
         d1+uSiN7Y4epz6vrzkMBWi1i+L2QBCzZyOiiRVcvoVPok5Irjnw3ssyVkcwGGdBVJ5dd
         hTA/Ic86sausq7R3PruVNtJGLsCTKl5f/KnwMZNPxYp/4sng7tR4LKsHQZQxGT50+X55
         zrwYzg+r8Bi7Bh/MSo69XZ+bTY7WxG/i/dIWW0XzpUlaA+Pe1LlzAE/OS6aEWi4Omke1
         Xak9fpq/2E+r1fOQttrLO7aVqtsb5UAXeRV7urps3qU93oUXS16FyI5ZfZuHqy9s5YOX
         2iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788067177; x=1788671977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KX320XcpLk3Fm8Cgd8srfW2N5vYbERamWv5i8xvHSo0=;
        b=koRSLGLh/GB3Omk+A1paHDWPXwJthgAgLhztVOcT/qpX9JT2JdZFqmNBvbFgHTvk9I
         pWYeoc4oJ1YMtaWhbmVaGwR8sDl4cC7JQD+8Tg0YmTUrPMsocSBaBCslqgKr6RXlN8zg
         mUspd430/fXVAEeK938mTJyFZCZoXK1llZa5/LjzkVBdW7wXDGHUUNjmq/SRYNmDMTsH
         AYGhOLHaXIyZWNfJi7/44nOPzDPOpnnNK6ihWC1W/RFrnuHjGzyZ2lbPjfHuzl09DFhd
         mgMo+l4UAhsXhrKQSlLz6pFzQ/v70iXX3vN5EU8v3dYBJ27pkF9YNKEWAvUIJuDhtst1
         siYg==
X-Forwarded-Encrypted: i=1; AHgh+RoPGYbS/Xsp2tGnRQHXqAL0oPT0ae4u97sKhuV8UzCzHxv+oxzmxs0QjUXvEC4fE7i68RlO6jVYucmxZQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nb6GvWldSbuuTcchi2qfa0LRTvSqmePSXAaCxDZ3YgTIs2PYfh
	tF7jo7lTITxFVGCZNeYZ/kRcVIqi/0y3QgAHr8tN7dLh5HgQqRlfQ5V3
X-Gm-Gg: AR+sD11e8jByD1/rvP/vlPFMSKgL3lrLf2zCQncf5YMbDBMhUtMPicqF28e8xRFymA+
	c5KSngrFamlMIGepoGYSqozfBThOoDtgJrLuYdXzkVDa3G36WbZWJH4enxfbbwPWP6ta2ybG6Nq
	bYxuYsX1S102K250TWerRw/7vwPuaCHL6bNZCpikOrDdJCepTqDu9VwLzTlkB0zICrNWWiPXDW6
	wRgIQA0ddRey5h8PN3AFOt9Mwlbmfr9qOlynPfx/N6w/CS4/+GrWCaXsd+NX3fwuX8DEJApYNH+
	+OMtdv4QFGMhNBUgU7LPwMLqpEsWSVeKaSPes4eUY+lKqB+xWWCwyEaYpSV3qcntseUfmSYP0UR
	L0q51OSCwaNYGxqusI6+9t6bR5PBPhn9UqwP1lNyFaD6pw6EkJCQKSIdaHv/py0TvM3G5xhcqFm
	7lgkTRV/A0Xmwh+Oa/+87/W72ax2j/53Rn4UwF8Mv9j0DBdAuWWrqxeEWYw/tgIsatf0nKhBQux
	u/5kFCbLKUUH/0=
X-Received: by 2002:a17:906:6a05:b0:c25:608d:7934 with SMTP id a640c23a62f3a-c25608d8c6bmr956979966b.12.1788067177195;
        Sat, 29 Aug 2026 22:19:37 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:4701:1ac4:1c21:4a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f249468sm269776566b.56.2026.08.29.22.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 22:19:35 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>
Subject: Re: [PATCH v6 0/3] hwmon: it87: add IT8613E support
Date: Sun, 30 Aug 2026 07:19:32 +0200
Message-ID: <20260830051932.10067-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <25b0930b-5d5f-4144-bf09-1c0837442ceb@roeck-us.net>
References: <20260829210036.61136-1-jerome.tollet@gmail.com> <25b0930b-5d5f-4144-bf09-1c0837442ceb@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guenter,

Nowhere that I can point to. I mistakenly used In-Reply-To when
preparing the resend. The documentation you quoted is clear, and I will
send future versions of multi-patch series as new threads.

Sorry for the noise, and thanks for applying the series.

Regards,
Jerome
