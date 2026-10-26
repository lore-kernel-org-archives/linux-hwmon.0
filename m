Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793005068;
	b=1q+djcbwcDjrElrMCQEB6Jd7nElpYG48Vn5C80vgnsgwjlezsjEM2aBKGyRt5LqPu5nm
	 NrasIkfy1YWmHouf9IahvkCw1JwZNq1ITYUvmjqHC65/veiW5YnfNbDmQRR+E/FO7ba7J
	 CTMbQLX691k/UgHV8ooVVYwr0JQ5Qs5CwV+6V9lAD4kJ/eclh/zf2gU+JXio6ChqlqiGv
	 YPVBIs7ROlz7fCItJX54fpAVz4KkiRw7Paag1GUFcz9ynOsQWQtoogbQlpvTr9Y4zYQXM
	 AsA+m2v4BF/nrB/9NHHhBG0UKbRJbT6w94aJIbIK2+i77oXT4AHDNGw2SCEntIUT/Uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005068;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=L8OYXZDTkfKylz3TRUXz5F+Ddj4Z4GIihf/IE3L80po=;
	b=rbXLKA9P/q8ZMYjWtgv/myZ/fC4nRakT3UHwQhOg85EEXbrOAqff0Q7YJRF+LnhXlLBy
	 Yl/7KLMeO91/EzhsFGIHjrofxNfAT1TO3s9h0JkDsLPwseWSPUhBcdpHqf3cUZZQkiluk
	 WvfXYO0rcK5fOuodznC+SFAIa0qGG3/59YJP3o5mSc5XuOqbB7r8PpKU6Ll7EN6cwzr6E
	 h9VxfhTLw9vsYifObVmCsAh7SW6Y74gkkD7yb1YVK5HipDYVnz+oMDYp57MutG7lTWl3Z
	 UciBlq15rpRO/iAxXrtzzX3TNPRyJaHpBzDD+6cEqf+b+81JCkwyWKPAUzKgmC9gkag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TV51WMQA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48B4606A31B;
	Mon, 26 Oct 2026 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TV51WMQA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793005068;
	b=a3RwC2ioAUqWM0GT7I89MWVB2YQNILz3cB0bw9/1xmKCP2vT3FX22XWZje8Xi5xykmV0
	 PQ4+vjdVLr0+ycy1qcITXTuR/jZVizo072ElIUbrncy8ww6X4KnDZM47L0TNCQQa5dekK
	 NSqtBYcvQLp631zcKJrkh2FPxYW3SEwL6fIQEACYGB387054AFIwO2a3v0lnY3qI1kVeu
	 rLYbFyK9RWzaAbBMqzrAYpiytpgr68MSvt1YBDVBvT32Pr5bUUBaaROFfUntZEnh4wi6E
	 cASjl+fOMrk4/OzhYnSGtc2bobbFULLxpr6LJelFG9t3rLBiT6Ajq9vwkIwLN2hAK3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793005068;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=L8OYXZDTkfKylz3TRUXz5F+Ddj4Z4GIihf/IE3L80po=;
	b=GSvhdHmCM89/fC0I70NDd4saQT37K54DXN36RbshfRtp1+tdTdUue4pGhB0VnvOFv/cs
	 +/NF3ENGLQa4Ws1xJlXWSaieUMn0o2+yFmBOt8htvX4Cs+ZfKS4/A8sh4z+Xwhn8ZfU4T
	 KWFjjHaqIM2b8n3J0spUvllcZHyfx67MR81IcdCflVtw1FGbi+zj8A7ApggbgIwWxWjLT
	 Jjp3UzrvTtqRuczLjL2hs86ANWijZC0Jd2J6TZKsXMi9FBXJnVXkw3N8Y06ACVB3ORqx3
	 wOlXVNfctaQRsAhq+v1wDVH7hf91YupIHxydbIiUrXu59oOlS13jhUBdcXWuFouN9kA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A46F01F01829;
	Mon, 26 Oct 2026 08:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793005068;
	bh=L8OYXZDTkfKylz3TRUXz5F+Ddj4Z4GIihf/IE3L80po=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TV51WMQAg7FcOPkwqdMKIcfzWuVRmM5NCjgBAf7yL/idfQqmzj08U47paWl8/GNxQ
	 vUNWl5OmogQ9tr0bQ17d/o2AmM7pIm0rS1DdJ4sU0gCZzDafo5dOLD7jtPJmTCSEQJ
	 JVJdG9yzDMGxv/hGivA1I0J2uTMH5eD5yWae3ZGOMPGLRyKuFAZ8RyrJQmlFItxQWh
	 1IC75h3qleEMDNvsUa4vTiNt847IrsLvqndmgkO5lMziGWKecKOVcbCnIjAoJTPs/U
	 UUa5RioJjpd4aSy83Xq6/zQPtC92j1jTCHmw+Z4vS8qbbxPdrA0eU/f5qlVrAyH8bZ
	 YzxW16JOcsCcQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0C73C44C7F;
	Mon, 26 Oct 2026 08:57:47 +0000 (UTC)
From: Remy Demangeot via B4 Relay <devnull+remy.demangeot.net@kernel.org>
Date: Mon, 26 Oct 2026 09:57:35 +0100
Subject: [PATCH 1/3] hwmon: (asus-ec-sensors) add EXT_Sensor temperatures
 for MAXIMUS IX EXTREME
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261026-b4-m9e-ext-sensors-v1-1-644d389b2de1@demangeot.net>
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
In-Reply-To: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Remy Demangeot <remy@demangeot.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793005066; l=1995;
 i=remy@demangeot.net; s=20261015; h=from:subject:message-id;
 bh=WyQhdqkdM10QFFAO+QYVgb4wy5e8BEIj6Hxrc9XW7Nw=;
 b=IsS3JVtgVcHZt6LMRA58mLfSaGRk0OeMoYSUZ4jIBAxWs3CD3Qx7RVDcXd+TBTvWwhC+Zwoew
 F4byR4xKpaLDkoMthVlHNQ6XFLuQE2rXN7h4hHcdCuHwAMOcVJI4ZLa
X-Developer-Key: i=remy@demangeot.net; a=ed25519;
 pk=h/s5N2ZlgZ0m+8FpMhSaCNJt0jvb9whRBAdJwpC+VAo=
X-Endpoint-Received: by B4 Relay for remy@demangeot.net/20261015 with
 auth_id=1194
X-Original-From: Remy Demangeot <remy@demangeot.net>
Reply-To: remy@demangeot.net
Content-Transfer-Encoding: 7bit

From: Remy Demangeot <remy@demangeot.net>

The MAXIMUS IX EXTREME supports three additional thermistor inputs,
EXT_Sensor1-3, located on the optional ASUS fan extension card. The
EC reports them at bank 0, registers 0x60-0x62, as signed degrees
Celsius, with -60 when no probe is connected (already handled as a
blank value).

Add them to the Intel 200-series family as Extra_1-Extra_3 and enable
them for the board.

Readings match HWiNFO 8.54 on the same machine, and moving a probe
from one header to another moves the reading accordingly.

Signed-off-by: Remy Demangeot <remy@demangeot.net>
---
 drivers/hwmon/asus-ec-sensors.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 3c97ae09cc19acad54696bff9e65d6bc4f3ce835..8966053b58173592a19afbab42ccbe8e6e6d7042 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -359,6 +359,12 @@ static const struct ec_sensor_info sensors_family_intel_200[] = {
 	[ec_sensor_temp_t_sensor] =
 		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d),
 	[ec_sensor_temp_vrm] = EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x3e),
+	[ec_sensor_temp_sensor_extra_1] =
+		EC_SENSOR("Extra_1", hwmon_temp, 1, 0x00, 0x60),
+	[ec_sensor_temp_sensor_extra_2] =
+		EC_SENSOR("Extra_2", hwmon_temp, 1, 0x00, 0x61),
+	[ec_sensor_temp_sensor_extra_3] =
+		EC_SENSOR("Extra_3", hwmon_temp, 1, 0x00, 0x62),
 	[ec_sensor_fan_cpu_opt] =
 		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xbc),
 };
@@ -523,7 +529,8 @@ static const struct ec_board_info board_info_maximus_vi_hero = {
 
 static const struct ec_board_info board_info_maximus_ix_extreme = {
 	.sensors = SENSOR_TEMP_CHIPSET | SENSOR_TEMP_T_SENSOR |
-		SENSOR_TEMP_VRM,
+		SENSOR_TEMP_VRM | SENSOR_TEMP_SENSOR_EXTRA_1 |
+		SENSOR_TEMP_SENSOR_EXTRA_2 | SENSOR_TEMP_SENSOR_EXTRA_3,
 	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_LPCB_SIO1_MUT0,
 	.family = family_intel_200_series,
 };

-- 
2.47.3


