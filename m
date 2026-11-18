Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023864;
	b=I0pMtzqTV+1bB4fKRQjc6HM/D8/YQ3YwVyLO2OU7DNl8jJEezLYCj+kOqq2sCeckeDcU
	 cM1E1rwy9CXTbu6dp7ZANrW5NaEu7YmWCb2tLnoBYaPJEsAIGme/1frOiPIblTqCQixma
	 l93xUDI5aez+cg/mzv5R1IBNWyHP2Pn4Gh/ccuScAT29pCHZ9FW62OWXu9Q7uXoTiRIeu
	 VGCWS95UVxu+gSLbro3I6VinczjzelTL/9wkKmAWQv3jcOCnu+51iWfYZp21KNsWps6VR
	 VqSE1+4S1Nl3YhVpBGqIjTlzUZthpr6NBX3QtVzXzwHD+K7txhDhq3gXraQQvWwLu9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sCmHtrQ+6XrvMRrdRCPqx5sKsj7rGGNMbxIOJEi2aPQ=;
	b=GvCzq4cb5QAD0PHtsYGEsvHEHrvq4gs04TSsu52iHrwJui221RGan0KjEf/BwOYmG+gv
	 XoKxGimUbl/nH6j0IqMD14BgC0VpiD2ss0KG2gtXb0ufptsOyDiOjYaoJDR90ezmcbVKi
	 trnUXgXXkZqlO5/HxIbixJ3JEL/r1KYztJ7V3nY1wqnzBj/YVZW3SmCR+L3FUEnCoCMtx
	 bb2QNKiDvx7es8MjDUCyE0CLRomQcyn39kiFK3vPpaEi6A8Li2d2dvQNYKI8hPPFMBS/d
	 6PvD1jNZcpTAnfjRVO8F2ieXm+4M9CdPig1u3x5dD5KH9mkQLb5fqeEsUML7YGn+jGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cWDo1b0;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9936606A320
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 17:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9936606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cWDo1b0
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4cdc606b47so219411166b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 09:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795023862; x=1795628662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCmHtrQ+6XrvMRrdRCPqx5sKsj7rGGNMbxIOJEi2aPQ=;
        b=0cWDo1b0Vz8NKj50u6qJhSdLYhHKP89Oa7NiQCl3Mzi6rEGcDWBIvlmv1Ps9NB6RhJ
         H5VT0LvBm7v8pMiM9gzrsa3leqeTEpB8QsoCdloW4ikHpV7B/i7FNAuprxbmy4C/40Kc
         AH1kAKabhVplQ5dKgPWCZD4ewibVjJnb0MGve5PVGgwocRJ7oYfd2pEQyUR2OwqIr4FR
         xNbAVTOQXvyF6Qwk4ToYTpuqnKTAWUk87h1pnaW96D4TL073dSjeBlvNOEhP+BiZwcyy
         bYKzYNTfxpp4bQOQOGcNr8pXtg8CysDPaU86LUwvEcvhXMJ00exZ+AMKKVNu74J3uHfg
         ou8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023862; x=1795628662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCmHtrQ+6XrvMRrdRCPqx5sKsj7rGGNMbxIOJEi2aPQ=;
        b=eNi9rDBXB9irIzCQ8uiuVggCZ1SlGgFweyEJr3kHXGOBjcHAotihNIhGPrkt/OL6MO
         aBgU+hpjeYFtuGvRkrWT+460Nv7EMJxaimhr2RcYXxPjNIbOwzwPbF1k3KR8+kEtfb7h
         aOB2GfRIgspTiR5SXLlg2Bgoq8HKn8/dBImm2x0jkYorNkcQvcLz6XnEKGZ9ateHxevQ
         +3+wS//Ra9RMzlObi5RzzCWhRvAFDd725W8GvPcCgZWRWOBb4KJIkohK8ky4o5mpRQRc
         WfNmGrhV3R2ob4P/+zz3EjhlmBvXZo/3vWHxr9UnDP3HZGL3ucV2vIDDndaPDY65xwbC
         W5nA==
X-Gm-Message-State: APuU4Z/PuCA6P1jHkJFYDjCa1hVqr8pCh7Wv2tyXGRMox+Ubz3WUlnde
	AI2hh/C1mlugMlFHCSmgDybQsvtp9Mcf3dQMMyLD21TP+0JXyShXDkF7ng8a+Ymu
X-Gm-Gg: AYBFou28uMLr9fiWa1YRJiKbSuhwJc9taM9B9NWW9agMEWp+G7t7YznIekWyET9d961
	HqRskP/xbUIRXri1do0XZ1AiEJ/+l5QsikQL/yaAz/K8JwxHJAL4TRsmgocaKVo52PXzAf0b86F
	Vfvok6kxV7w0pfR3bF3J3xPDZReO7f7DVJmeVVsXhG3f2I+O1+iL2qkI0TOa0Asw8E3297VEsu3
	DGTy2Q4YuE1vSc7IQYipR/Ree8v4JDy6eRFfSHDJ2cdSCe1/RUKEWXMbP948JE/hc1FYI+Hst+U
	t6maFRKwAPsJ6/A8eLpiN3XuQqfRf4QfYPtPsVUk59CQuHyAg73ZvafBoF7EtLUxqeYkN3GhC/l
	uyQCUjaJeMBIDH6afatkQ9OHYXaISKVw6mjVqZX1UfogJD7E1VDVSfAoLFgJewoMSb37VVm98M8
	WhviA06P4KqS9rsBi8PUVakZv96yV58bscbI+01JeV3mK9naeOS6cnG2bJj3OK/9pITyXXpPQ3z
	KzwD64N2VmebB3XocpimEI077QMxwB1M0IBbn9n0cUdA3Qx//RLc9n21wv9OJZWnZS3eTgzCuH3
	lRFxfiKkuvAvehAPDeS40GVk45wBqxzDL99iq3SaZlcqNFor1yoiNY6Ce8IwMnF0aWtTnj3ewRE
	jsR1s8qRWNq1IDtsLznLNuZBTdQaL6BXcNw==
X-Received: by 2002:a17:907:d406:b0:c49:cfcf:8d7f with SMTP id a640c23a62f3a-c510e3bd593mr314327866b.46.1795023862016;
        Wed, 18 Nov 2026 09:44:22 -0800 (PST)
Received: from fedora.tux.internal (85.191.71.118.dynamic.dhcp.aura-net.dk. [85.191.71.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c3befsm25904066b.26.2026.11.18.09.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:44:21 -0800 (PST)
From: Bruno Thomsen <bruno.thomsen@gmail.com>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: ti,tmp401: Add channel nodes with label property
Date: Wed, 18 Nov 2026 18:43:33 +0100
Message-ID: <20261118174334.18759-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.56.0
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

TMP401, TMP411, TMP431 and TMP435 have one local and one remote
temperature channel; TMP432 has two remote channels. The local channel
measures the board where the chip sits and a remote channel measures
whatever diode is wired to it, so only the board design says what each
channel is.

kam,am335x-emperor-mini fits a TMP431 in place of the NXP SA56004 on
kam,am335x-emperor, at the same I2C address. On both boards the local
channel measures the baseboard and the remote channel the FPGA's
thermal diode. national,lm90.yaml already lets the SA56004 name its
channels through channel nodes with a label property; add the same
nodes to ti,tmp401 so the TMP431 channels get the same names.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
v1: https://lore.kernel.org/linux-hwmon/20260730133058.14731-1-bruno.thomsen@gmail.com/

Changes in v2:
- Rewrite commit message around the board that needs per-channel
  labels, rather than referring to other bindings. (Krzysztof)
- Quote '#address-cells' and '#size-cells' consistently with the
  patternProperties key. (Krzysztof)
- Drop the new example and extend the existing ti,tmp431 example with
  the channel nodes instead. (Krzysztof)
- Reword subject: the patch adds channel nodes, not just a property.
- Rebase on the new "#thermal-sensor-cells" property, which moved
  the patternProperties context.

The "kam,am335x-emperor" device tree series that consumes this is at
https://lore.kernel.org/linux-devicetree/20260318085420.7680-1-bruno.thomsen@gmail.com/
Its v2 adds "kam,am335x-emperor-mini", which uses these channel nodes.
---
 .../devicetree/bindings/hwmon/ti,tmp401.yaml  | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
index f283b567d5b6..b162bf8c043a 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
@@ -30,6 +30,12 @@ properties:
   reg:
     maxItems: 1
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
   ti,extended-range-enable:
     description:
       When set, this sensor measures over extended temperature range.
@@ -53,6 +59,26 @@ properties:
   "#thermal-sensor-cells":
     const: 1
 
+patternProperties:
+  "^channel@([0-2])$":
+    type: object
+    description: Represents channels of the device and their specific configuration.
+
+    properties:
+      reg:
+        description: The channel number. 0 is local channel, 1-2 are remote channels.
+        items:
+          minimum: 0
+          maximum: 2
+
+      label:
+        description: A descriptive name for this channel, like "ambient" or "psu".
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 allOf:
   - if:
       properties:
@@ -75,6 +101,16 @@ allOf:
       properties:
         ti,beta-compensation: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: ti,tmp432
+    then:
+      properties:
+        channel@2: false
+
 required:
   - compatible
   - reg
@@ -103,5 +139,17 @@ examples:
         ti,extended-range-enable;
         ti,n-factor = <0x3b>;
         ti,beta-compensation = <0x7>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        channel@0 {
+          reg = <0x0>;
+          label = "mainboard";
+        };
+
+        channel@1 {
+          reg = <0x1>;
+          label = "fpga";
+        };
       };
     };

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.53.0

