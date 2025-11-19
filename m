Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B290834AAEF
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Nov 2025 10:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763547514; cv=none; b=bKeBj0QUl0e2+8Iafw6POpyDoUpD5vcGfyAJOcQ34n2o0gsEfio+BaKpAN8Jlsj7rQrbdsFcdCss4sAxy0DTh3SUreL2+ooSTboZQdielZdywce8uEKMEYHCGKU+vvUyUsCsjOMnGJSImOmwI9bLqmTbE9INj5LHbfxUspbRkwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763547514; c=relaxed/simple;
	bh=9+w9v00Uusw0QL1bE5lLs1iFlk9t0nIWbMdfeiUQ62Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eqVtxbwevTb1vFisUC6MJU5QWTQbhCWEc/mE9suU36FpAc6SCJ48lVQLKH2qF6KGchQd19kv6ekC1CLrSbYr+kGphv//8SUPCF6EPHauEN6ZsenYuMei6OjJDfcJgt2mcHWtDlzujk5hKbdMR96DLg1m6/UZjj6xyu7/8kNaU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWx5kDYZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWx5kDYZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763547513; x=1795083513;
  h=date:from:to:cc:subject:message-id;
  bh=9+w9v00Uusw0QL1bE5lLs1iFlk9t0nIWbMdfeiUQ62Y=;
  b=HWx5kDYZucoYX0cErdoQQldvfv/AVi+IFIKinZ2B+mytnXUzBLQynT54
   22tJfwPEJUCsV9ky33oET3jkHjc+JIOgMWM7bQIpvtYNnXMsV3G167vhs
   xEm4QawAuRY5hvwNDdS4qRCOFrX8Glhiyk1L2IlK4bpSoGAiKsXXc1kRi
   bH6TbK+iz92jedRjzKskdi034Rz497giD25b01kdTKS0dfFEomvObGTUE
   gHrWmUhh/ofjI1IsdwTbooe77XFqiPya6hh/HX7cMynJcx8d2KhIrNh2b
   irlAMFT8WeI37pauhBAotunR73g2bk36NIKlTWRiAqOyDhToAJEO4IVhY
   g==;
X-CSE-ConnectionGUID: vHGzwBcWRdqg73bdNyFdiw==
X-CSE-MsgGUID: 3LpP3maiSbmqpUmPq14asg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65624176"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65624176"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 02:18:32 -0800
X-CSE-ConnectionGUID: qWyu3ouiQviWChMD7KYBtw==
X-CSE-MsgGUID: cMVoVh3MT0CZmIG5nPFReQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190283618"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Nov 2025 02:18:31 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLfGe-0002jH-2m;
	Wed, 19 Nov 2025 10:18:28 +0000
Date: Wed, 19 Nov 2025 18:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 536b024fc158f85c6bf837014526da32c9d2f21b
Message-ID: <202511191805.YWzBBaUT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 536b024fc158f85c6bf837014526da32c9d2f21b  Merge branch 'fixes-v6.18' into testing

elapsed time: 7958m

configs tested: 62
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-15.1.0
alpha              allyesconfig    gcc-15.1.0
arc                 allnoconfig    gcc-15.1.0
arm                 allnoconfig    clang-22
arm64               allnoconfig    gcc-15.1.0
arm64              allyesconfig    clang-22
csky               allmodconfig    gcc-15.1.0
csky                allnoconfig    gcc-15.1.0
csky               allyesconfig    gcc-15.1.0
hexagon            allmodconfig    clang-17
hexagon             allnoconfig    clang-22
hexagon            allyesconfig    clang-22
i386                allnoconfig    gcc-14
loongarch          allmodconfig    clang-19
loongarch           allnoconfig    clang-22
loongarch          allyesconfig    clang-22
m68k               allmodconfig    gcc-15.1.0
m68k                allnoconfig    gcc-15.1.0
m68k               allyesconfig    gcc-15.1.0
microblaze         allmodconfig    gcc-15.1.0
microblaze          allnoconfig    gcc-15.1.0
microblaze         allyesconfig    gcc-15.1.0
mips               allmodconfig    gcc-15.1.0
mips                allnoconfig    gcc-15.1.0
mips               allyesconfig    gcc-15.1.0
nios2              allmodconfig    gcc-11.5.0
nios2               allnoconfig    gcc-11.5.0
openrisc           allmodconfig    gcc-15.1.0
openrisc            allnoconfig    gcc-15.1.0
openrisc           allyesconfig    gcc-15.1.0
parisc             allmodconfig    gcc-15.1.0
parisc              allnoconfig    gcc-15.1.0
parisc             allyesconfig    gcc-15.1.0
powerpc            allmodconfig    gcc-15.1.0
powerpc             allnoconfig    gcc-15.1.0
powerpc            allyesconfig    clang-22
riscv              allmodconfig    clang-22
riscv               allnoconfig    gcc-15.1.0
riscv              allyesconfig    clang-16
s390               allmodconfig    clang-18
s390                allnoconfig    clang-22
s390               allyesconfig    gcc-15.1.0
sh                 allmodconfig    gcc-15.1.0
sh                  allnoconfig    gcc-15.1.0
sh                 allyesconfig    gcc-15.1.0
sparc              allmodconfig    gcc-15.1.0
sparc               allnoconfig    gcc-15.1.0
sparc64            allmodconfig    clang-22
um                 allmodconfig    clang-19
um                  allnoconfig    clang-22
um                 allyesconfig    gcc-14
x86_64              allnoconfig    clang-20
x86_64                    kexec    clang-20
x86_64                 rhel-9.4    clang-20
x86_64             rhel-9.4-bpf    gcc-14
x86_64            rhel-9.4-func    clang-20
x86_64      rhel-9.4-kselftests    clang-20
x86_64           rhel-9.4-kunit    gcc-14
x86_64             rhel-9.4-ltp    gcc-14
x86_64            rhel-9.4-rust    clang-20
xtensa              allnoconfig    gcc-15.1.0
xtensa             allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
