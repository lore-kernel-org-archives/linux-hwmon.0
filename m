Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C843538A710;
	Fri, 22 May 2026 07:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779433388; cv=none; b=j1GJbsjEUK1Zx6sROJRObg6g+m6JAEbC4XCUsyabXAB7KqZ84FzXbp8YZqzoAHtp4/U/bwjmO3Qnx3Rvg5F3IwpfX2JzB+Jx1WjWwXb034hldbrn/k2OUyg8p3cCQkelhZK3vx0Uf/F0eyNjsgbfxjFj5H0y1PGYwtp0rAJK3yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779433388; c=relaxed/simple;
	bh=4RLjP9RUqPzryq9T6qgk1AjiOYFgZeMQSUYBnoTaQmI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rXCRfJGyQqReifrFOXtKTJycaMy+0oUq0Qs15p/GMpyGKW7HVc17P/o6XkbzEwtNQy6FEJG2HBLNjSPTxnUoD9up2ZHR7qEbo3/ZlExqPY9qMRoBqaF6U/tCSrNtHqIuzHvZZzSIHcLmp53MMUH6/0OQzAChsa/DIpYTJnp0cNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKUfEVLM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKUfEVLM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80BEEC2BCB3;
	Fri, 22 May 2026 07:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779433388;
	bh=4RLjP9RUqPzryq9T6qgk1AjiOYFgZeMQSUYBnoTaQmI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WKUfEVLMcXJSYppz4KQ2ZMEd8g+y1H9u6GQNsi5fqQZGyAhDgcxEdtxuJpLhaomp1
	 JAxbUFOuXvY/KxCAz7GSWT6VCAGoPrmwLzQ4HfxVplqt/8eySl1dSZInl2ALHcUu3R
	 nOsaEu8YtXEYOd8vbiXPXnMStS4b0CL+mNB34NYG/Qbc+8PBnG0+nSJw5S8ck3vYuW
	 gK5oKOZbX6rmcoGiCBeTDpN5HtosTLCgTJVvVJHOcKAabO7wqDMDUxiP9LLanGcsFw
	 WLAvQhLXqOll+lpNZQFbkCdYN5l5uK06pqh4CkETiN1/Es6YchM7huog71hSBfbm9i
	 1krbx2v4qccEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705C3CD4F3D;
	Fri, 22 May 2026 07:03:08 +0000 (UTC)
From: Ferdinand Schwenk via B4 Relay <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Subject: [PATCH 0/2] hwmon: ina238: Add samples and update_interval support
Date: Fri, 22 May 2026 09:03:02 +0200
Message-Id: <20260522-hwmon-ina238-add-samples-update-interval-v1-0-e1acfceb447e@advastore.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2N0QrCMAwAf2Xk2UAbWS3+ivgQbOYCW1eabQpj/
 27x8eC4O8CkqhjcuwOq7Gq65Ab+0sFr5PwW1NQYyFFwPTkcP/OSUTPTNSKnhMZzmcRwK4nXpud
 V6s4TUrwFH/oo3g/QcqXKoN//6vE8zx9xfc6regAAAA==
X-Change-ID: 20260520-hwmon-ina238-add-samples-update-interval-28761658e11f
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ferdinand Schwenk <ferdinand.schwenk@advastore.com>, 
 richard.leitner@linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779433387; l=1417;
 i=ferdinand.schwenk@advastore.com; h=from:subject:message-id;
 bh=4RLjP9RUqPzryq9T6qgk1AjiOYFgZeMQSUYBnoTaQmI=;
 b=8ppIDYkAzkEQRrctMXXWgnhUkFgtMcd+4xB3OWx1qr+xQv9S7HffJSlRX5WGDozFjtr37golk
 JMg2b32QKnQCYbTjn8Ypm+dTc4+LiKqVNYP91wbj7BjAE47E9VdjViR
X-Developer-Key: i=ferdinand.schwenk@advastore.com; a=ed25519;
 pk=HyA9NdHJ7NystP+1SyuWJeyXNH2EO4A09FXli9mfs9Q=
X-Endpoint-Received: by B4 Relay for
 ferdinand.schwenk@advastore.com/default with auth_id=788
X-Original-From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
Reply-To: ferdinand.schwenk@advastore.com

This series exposes the INA238 ADC_CONFIG register's averaging count
(AVG) and conversion time fields (VBUSCT, VSHCT, VTCT) through the
standard hwmon chip-level attributes chip/samples and
chip/update_interval.

The first patch adds read/write support for both attributes using a
per-chip conversion-time lookup table to correctly handle all
supported variants: INA228, INA237, INA238, INA700, INA780 (sharing
ina238_conv_time[]) and the Silergy SQ52206 (sq52206_conv_time[]).

The second patch uses microseconds as the unit for update_interval
instead of milliseconds.  The INA238 supports conversion times as
short as 50 us; millisecond precision would make the four shortest
steps (50, 84, 150, 280 us) indistinguishable and inaccessible.
Since chip/update_interval is introduced in this same series, no
existing ABI is broken.

Signed-off-by: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
---
Ferdinand Schwenk (2):
      hwmon: ina238: add support for samples and update_interval
      hwmon: ina238: use microseconds for update_interval

 drivers/hwmon/ina238.c | 134 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 132 insertions(+), 2 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260520-hwmon-ina238-add-samples-update-interval-28761658e11f

Best regards,
-- 
Ferdinand Schwenk <ferdinand.schwenk@advastore.com>


