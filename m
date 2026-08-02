Received: from sender-of-o59.zoho.eu (sender-of-o59.zoho.eu [136.143.169.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6EE2DD5F6;
	Sun,  2 Aug 2026 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785683497; cv=pass; b=QusACtsYBJ+BpQRFHqJ+IEz6JmsLz416KSij4818MDbutCfA/0y90QJGhjlgI3a0imP5d2UDcMNoIWA9ycqA0STdPeTzoWB1VAGj48ZZCReAcRPd8BZHI1L93jpKseVhYGxTFQaszckmRP0jsw/i1rzik9ff6e0I3mqEymVIZkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785683497; c=relaxed/simple;
	bh=P3dbApUNHOJ8hKhRc+kp1e6tfSvPBYLmoY2LcVKOJDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ccUNR6IiZ2oNUcsZEV//lbJ/4I3pYBIbVVwNVjJ8F5B4N2YpU310iwFuwNycDCkhP8Omzffzg1ii3I9lr1kCtiAV0mHXQbv5olpNSGTPCZdSQxGwgzxBBzss4C+yUXIO8Xdd5HatVhP2HOqMB3m8WaqCWlcBBM5LuG5JcNcmzAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=XTsmKVY0; arc=pass smtp.client-ip=136.143.169.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="XTsmKVY0"
ARC-Seal: i=1; a=rsa-sha256; t=1785683476; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Ub4grEfG6DzsneNo2pZFsJjNiDjMrbpATK+r8CS11ACvSDnu2Zwf3OpdNFOdEbJrjb9uXJ8T/vc3a4ZMsmXfPyP8hjQI8x02QqoTHxWIq081881oBemcEdcnn4p02TWCf3ERxQk27UJX33q/aHzRYCI7HDjzipZkLhtg/53dRTs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785683476; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nD9vGvtmsy/II5sJipLImuuK4LVObmxkLcQgNfLGsJI=; 
	b=dCoj1YKQ76Fr+c4xemw5oUjo3EhU0U8lqr90s7FeoDTjYDi9d+8Bdb08VS/fI4vLAw6e6krK5z1Vy/86HGiMWILwyLoFk6iV6OVQPVZXUwzBVzuS1AvxV4sDI3AQri3XqCDJd0phT7jm4LMqLi//QjhnQNuj9oUJzQdAAAEK5Zg=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785683476;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nD9vGvtmsy/II5sJipLImuuK4LVObmxkLcQgNfLGsJI=;
	b=XTsmKVY0wnfyxXyeFCrsZ3qm/wc64Nlw+IR3qLQxwVWsBqC38hSa8PRaxlE4pCvI
	90fgBHDBzwyPtydoMypXSdSVtaL74pog4gcmN5idQqC7JjVNXO0dAI2+CtiU+WOXCjo
	rHxyJscK4x39rT/rdpqV0hKO4o2bGJRrKuLHE3rQ=
Received: by mx.zoho.eu with SMTPS id 1785683473194648.0219444484592;
	Sun, 2 Aug 2026 17:11:13 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (sg2042-mcu) reject short uptime reads
Date: Sun,  2 Aug 2026 15:11:02 +0000
Message-ID: <20260802151102.37600-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8f25c37b-8408-47f2-8069-87a1ef96ce7e@roeck-us.net>
References: <20260802130728.25721-1-ali@iusegentoo.com> <8f25c37b-8408-47f2-8069-87a1ef96ce7e@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Sun, Aug 02 2026, Guenter Roeck wrote:

> Please refrain from sending fixes for non-issues.

You are right. Please drop it.

I checked what i2c_smbus_read_i2c_block_data() returns without checking
which protocol it runs, and the two block protocols do not behave the
same. In i2c_smbus_xfer_emulated(), I2C_SMBUS_BLOCK_DATA sets
I2C_M_RECV_LEN and reads back with

	memcpy(data->block, msg[1].buf, msg[1].buf[0] + 1);

so there the device supplies the count and a short reply is a real
thing. I2C_SMBUS_I2C_BLOCK_DATA, which is what this call uses, sets no
I2C_M_RECV_LEN, sends msg[1].len = data->block[0] and reads back with

	memcpy(data->block + 1, msg[1].buf, data->block[0]);

which never touches data->block[0]. An I2C block read carries no length
byte on the wire, so nothing can shorten it, and a transfer that is cut
short fails with an errno rather than returning a smaller count. time_val
is fully written whenever the call succeeds.

I should have read that before sending, rather than reasoning from the
return value alone. Sorry for the noise, and for the stable Cc on top of
it.

--
Ali
