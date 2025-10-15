Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A634B2D3EFD;
	Wed, 15 Oct 2025 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539907; cv=none; b=JPRkwgI5jiGCzg5Uy18lXkidfGkzekfZ1gU6M9q9uoueBodJ65hgtPOjKRogZxuwWd6s3fYeurfzk6vDovUKtyCx9kXewIrIVIriZ6wRaW9JyykrT+qg+R44+CPS/qGXEQPZu1mCT6UFlifnM+EhVxSES2cTV5gH8qmH1LV+Y9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539907; c=relaxed/simple;
	bh=5FXCmHLwXXNVqUBOleAFVnQZfagtFHzvE7MB9x1wedM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X50UgDbiSlZv5xuirwQVN1VblNw4mnOni+rLLkaa3boaINrh2WAqJ7DnN3F3bnXA4MP098cnJP+O285TS5RMXqWFe5HqNCDNfDZdrNNt6VqxW2G0/JFmx4WlP7zBlqcQoV1N1GVNYlYSYQcPHYMAraDig7YfJVhJ1nuHy0/uxek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKcZmFLD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKcZmFLD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3429BC4CEF8;
	Wed, 15 Oct 2025 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760539907;
	bh=5FXCmHLwXXNVqUBOleAFVnQZfagtFHzvE7MB9x1wedM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZKcZmFLD9WVgqOQuaSib3XNEo+C4UB8NbKf452OuvMmtbz8u2qMfy0YhJWrgkYddU
	 l0yExKoV8kgcbagVXiv+WA6gYMYBtQUgXnt1lUrMNM8uEXM04kaDpz2eBvJF6QfmB+
	 u1Ou+IpOK1kWw7vXIRwzx8Gn2gm3D07xSALIHaRi3KjAi9joGgnMl2OjW4PkUQR951
	 J9ywBzVRz9jmIDfYtXJi0dCcwZgCKtAFFXOYOMIJBK13nvDXId0bIyAsE7hqoMlt7o
	 7A6LqKLdLDTy1EhsHpuWiWfrxM3Lq626eLiCBp8xCCNGyYTDXZ+AEBSN346wBXk5Qc
	 JmyfxEbZn65Sw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20469CCD185;
	Wed, 15 Oct 2025 14:51:47 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH 0/3] hwmon: (adt7410): Add ADT7422 support
Date: Wed, 15 Oct 2025 15:52:18 +0100
Message-Id: <20251015-dev-add-adt7422-v1-0-7cf72d3253ad@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACK172gC/x2MQQqAIBAAvyJ7TlBJsr4SHTZday8VGhJIf086z
 GEOMxUyJaYMk6iQqHDm82iiOwF+x2MjyaE5GGWsVtrKQEViCI176I2R3vXrGBGd0gituhJFfv7
 jvLzvBxlJtHthAAAA
X-Change-ID: 20251015-dev-add-adt7422-c84b9faa801a
To: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760539940; l=810;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=5FXCmHLwXXNVqUBOleAFVnQZfagtFHzvE7MB9x1wedM=;
 b=fgqNh15zVWNQU8YQFFLfp5IlBdzgzjfl3s20pLVM0bj82yLGcRbG6cpWDGjIujzhYUoq/qoKJ
 4xxS6eJgAyGCXZA/2Ww9T9J6IiFLC09MLXZ+xZnFjX3/XtpwreywtPL
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

The main goal is to add support for the ADT7422 digital temperature
sensor which is similar to the ones already supported by the adt7410
driver.

While on it add the devices to trivial-devices and a proper of_id
table.

---
Nuno Sá (3):
      dt-bindings: trivial-devices: add ADT7410, ADT7420 and ADT7422
      hwmon: (adt7410): Add OF match table
      hwmon: (adt7410): Support adt7422 chip

 Documentation/devicetree/bindings/trivial-devices.yaml |  6 ++++++
 drivers/hwmon/Kconfig                                  |  6 +++---
 drivers/hwmon/adt7410.c                                | 11 +++++++++++
 3 files changed, 20 insertions(+), 3 deletions(-)
---
base-commit: 4b5bf30f28d5f8401f2314dcf28b9d9d5ff092cd
change-id: 20251015-dev-add-adt7422-c84b9faa801a
--

Thanks!
- Nuno Sá


