Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95DB1A9F91;
	Sat, 26 Sep 2026 00:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790381702; cv=none; b=jE0zcFmzMWCf24TxzIzuq9qUHjyhOEyCkl6Mq2YiOG4BBUIGggRo5OBIuuKaIaXaZmnpitnIbp44zI0M9+JVh1qsgFhtPkowCn62WzmfKcejSPm2B6xIM3n7ZQFv1KO9ce3mWfHECQlzC5KRViowslo67k0QyqLcBPCfXqZiYXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790381702; c=relaxed/simple;
	bh=Ysf3hXdapRgJKjXRQBvcacrX48OYb5yYpwnETBQnhs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hOq19aGu61npWZHTeqwnOFoDRXF5LjuHdwqBx+D2wfeicOOEHRrixs90mM8sRy34pD1cou4oMLWXBY8pCrVNh3vBUaxaGJDAC2h+bqh4aGEQisaNiPQOor+hBVUTV/GHHgDsloavDNbIxqsfNmCXmB2rP5i1LT4V8+6FbIm0ImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RpbwFj5/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpbwFj5/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66EB6C2BCF4;
	Sat, 26 Sep 2026 00:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790381701;
	bh=Ysf3hXdapRgJKjXRQBvcacrX48OYb5yYpwnETBQnhs4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=RpbwFj5/sRdN5cnKZFaY7S+8h8LngOkXWZqUn+sd2f2bPuejYwu1cqCKwoAttl0iI
	 jPPjgAT31HGF5yomwMEPs/LziC9PUBp7VJ+QHsVo51v4Lz+Y3Lvn6WC2AsYk318k2t
	 KyPFCn/fhTaZhcUmJCBRmClgHczigF1Dt28F9oZ4Kqi9C1OtpGSI/Id4Vlq2fnkw7f
	 4m9XHP9cLLVQQPIbnW1F9hiouEzf8395ShY/cMx5tBEb7XhlZ24gRuQdbT91SCU16c
	 oW6BRL3tHWxq+k80oKnl7m2xuaAOpHoKPpeBCm5eMgLe+UNXVLJgJvyrN740whPd5r
	 UdM8wOxcmAiAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4388EC98326;
	Sat, 26 Sep 2026 00:15:01 +0000 (UTC)
From: Alexei Solcanu via B4 Relay <devnull+alexei.solcanu.pm.me@kernel.org>
Date: Fri, 25 Sep 2026 20:13:26 -0400
Subject: [PATCH] hwmon: (gpd-fan) Reset both fans to automatic on duo
 boards
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-gpd-fan-duo-auto-v1-1-29bb670b3331@pm.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1gZqQUe9irioTdS4aKW1Ioh3n
 46zfIv/b4gchCP0xQ2BT4niXUZVFmBX4xZGoWzQSjeq0zUuO+FsHFLyaNLhsf1UxB0r1ZCFnO2
 BZ7ne5TD+HdO0sT1+H3ieL+BMUxV0AAAA
X-Change-ID: 20260925-gpd-fan-duo-auto-871de9e006dc
To: Guenter Roeck <linux@roeck-us.net>, 
 Cryolitia PukNgae <cryolitia@uniontech.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Antheas Kapenekakis <lkml@antheas.dev>, 
 Alexei Solcanu <alexei.solcanu@pm.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790381700; l=1730;
 i=alexei.solcanu@pm.me; s=20260925; h=from:subject:message-id;
 bh=51VJvSwDQla9NOxqOKK4VxeGGVC99wAKjXjwdGLu0nY=;
 b=thvE8DAPsnC+GtKVFFkyEKs3q+UviEB0Q5G5Hs9qNhaXgBPQPJRPeUgAs4jomqp4K8qAv1vnQ
 tKUqDY/QZX9Bo8LqXDij1Rzq9UtugXoIdm7qu1w6ZIo/Xri3oyFTiwQ
X-Developer-Key: i=alexei.solcanu@pm.me; a=ed25519;
 pk=iK6ervbccknflfirBb6E4x7TaOyCpnoGd33gzfiNEeo=
X-Endpoint-Received: by B4 Relay for alexei.solcanu@pm.me/20260925 with
 auth_id=1064
X-Original-From: Alexei Solcanu <alexei.solcanu@pm.me>
Reply-To: alexei.solcanu@pm.me

From: Alexei Solcanu <alexei.solcanu@pm.me>

On boards using gpd_duo_drvdata (GPD Duo, GPD Win 5), writing
pwm1_enable=2 only returns the first fan to EC control. The second fan
keeps its last manual duty cycle, e.g. full speed after pwm1=255, so a
fan control tool that exits leaves it running at that speed.

gpd_duo_write_pwm() writes both fan registers (pwm_write and
pwm_write + 1), but switching to automatic only clears pwm_write.
Also clear pwm_write + 1, so both fans return to EC control.

Tested on a GPD Win 5 (G1618-05). Not tested on the GPD Duo.

Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
Assisted-by: LLM
Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>
---
Both fans were set to full speed (pwm1_enable=1, pwm1=255), then
switched to automatic (pwm1_enable=2). Values read from the EC 15
seconds later:

                 0x047A  0x047B  fan 1     fan 2
  without patch  0x00    0xf4    2542 rpm  6379 rpm
  with patch     0x00    0x00    2545 rpm  2560 rpm

Fan 2's RPM, found by probing, is at EC 0x0476/0x0477.
---
 drivers/hwmon/gpd-fan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index ed212615b2f..b3b75f99f58 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -444,6 +444,7 @@ static void gpd_duo_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABL
 		break;
 	case AUTOMATIC:
 		gpd_ecram_write(data->drvdata, data->drvdata->pwm_write, 0);
+		gpd_ecram_write(data->drvdata, data->drvdata->pwm_write + 1, 0);
 		break;
 	}
 }

---
base-commit: 3cbb5f15e464583e59c8501a7085ec12b53e23ac
change-id: 20260925-gpd-fan-duo-auto-871de9e006dc

Best regards,
--  
Alexei Solcanu <alexei.solcanu@pm.me>


