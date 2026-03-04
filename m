Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09B4332638;
	Wed,  4 Mar 2026 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772619430; cv=none; b=AhLxzQb6dq4cQzGUeVvhz0naohoNWSFyJYO8MhqtwWmRrrj+JdaM/3FZEdAv5zQZsC4fgATDR724DEkIe5q+orS4qXHMabrPdc8cMXgu/CAzNldATMyhF73qGwzDAzReA4dW7IqdZt+Zvs1abfhMKphVCfuCX6QkjK88Vn1rrxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772619430; c=relaxed/simple;
	bh=mWiAJbCRK0yeePFwZJr4QPSj6aYs+Ww8XCgBmmat+eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FRSuA0EKlgV7lrvrXlLOyZOOWyFwCaHUtOmHk4yV3RoXAJDSMlWDS9Ra9qq+BCd9/LLZnxjDCTLo/lc2RoxqY0Blka4d+EqKIxn0E6hsit+VnLobdz5iVCl8C+CFCNIMpFc2KZNiSzJz5wmxlsPcxxIb80n+FNKphwULhqjhLZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaBkOQMq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaBkOQMq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84CFAC2BC87;
	Wed,  4 Mar 2026 10:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772619430;
	bh=mWiAJbCRK0yeePFwZJr4QPSj6aYs+Ww8XCgBmmat+eg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YaBkOQMqeumvoLskIqdR+6EC8T7n6bBhqGuHNoJi/55VtgPiLiGSkMXJBj9Eyw41Z
	 VPMi4hTVYeG748FqlhT91vL/Vr1sqH/iob8uuiYF+uUSHe0PLWjzYc4Z1UozDU8RJe
	 dBo6bNpgZCAPIRPJQxyd+pCXxSK5+ytEbcxbFByiq7LjBfeOIKFwEuSvQXDrw5z2/A
	 yy9RS1x+CP3iQUQXddfJtJiKoZzyaGTUPzq6KoGy0O/zrxqYt+LnYziDRMzQHg/EyL
	 wbvFHTOO4EuGSqd7sDEe+p5FH+n6gQNTmAp4vRAWdmAlMaijdY6dbZz0KWXxOsT2aP
	 Cot+Kk/7BOKDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EF2EB7EB6;
	Wed,  4 Mar 2026 10:17:10 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 04 Mar 2026 10:17:47 +0000
Subject: [PATCH 1/2] docs: hwmon: ltc4282: Fix scanned addresses
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-hwmon-ltc4282-minor-improvs-v1-1-344622924d3a@analog.com>
References: <20260304-hwmon-ltc4282-minor-improvs-v1-0-344622924d3a@analog.com>
In-Reply-To: <20260304-hwmon-ltc4282-minor-improvs-v1-0-344622924d3a@analog.com>
To: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772619475; l=801;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=jPyppxlzp7XoW4MdpRfX3YQFjkyTPLdNWTIArrDAgW0=;
 b=kCK8mYK8XLjBzElvpm6ulRJxAJbqS//Q/YpKqLgnCvCSz7tXyxAYu1cKIaPlYIV63WuBZdAgV
 2lJSF9c4ud8Ax6r79FgR/7rjopOsH6VMcaLk/ZXHdCiRUvVUzyak8l8
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

The LTC4282 driver does not implement an I2C .detect() callback, meaning no
I2C address scanning is performed. Update the documentation to
reflect this by replacing the listed I2C address ranges with "-".

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 Documentation/hwmon/ltc4282.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/hwmon/ltc4282.rst b/Documentation/hwmon/ltc4282.rst
index a87ec3564998..dd730207b141 100644
--- a/Documentation/hwmon/ltc4282.rst
+++ b/Documentation/hwmon/ltc4282.rst
@@ -9,8 +9,7 @@ Supported chips:
 
     Prefix: 'ltc4282'
 
-    Addresses scanned: - I2C 0x40 - 0x5A (7-bit)
-    Addresses scanned: - I2C 0x80 - 0xB4 with a step of 2 (8-bit)
+    Addresses scanned: -
 
     Datasheet:
 

-- 
2.53.0


