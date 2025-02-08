import { test, expect } from '@playwright/test';
import { execSync } from 'child_process';

const paths = execSync("cd build/html; find . -name \"*.html\"").toString().split("\n").filter(it => it);

test.describe('Visual regression tests', () => {
  test.beforeEach(async ({ page }) => {
    // ブラウザウィンドウのサイズを固定
    await page.setViewportSize({ width: 1280, height: 720 });
  });

  // if (paths || paths.length == 0) throw 'paths are empty';
  for (const path of paths) {
    test(`screenshot comparison for ${path}`, async ({ page }) => {
      // ページへ移動
      await page.goto(path);

      // ページの読み込みが完了するまで待機
      // 動的コンテンツがある場合は適切なセレクタで待機する
      await page.waitForLoadState('networkidle');

      // スクリーンショットを撮影し、既存のものと比較
      await expect(page).toHaveScreenshot(`${path.replace('/', '_')}.png`, {
        // 許容する差分の閾値を設定
        maxDiffPixels: 100,
        // スクリーンショットのスタイル設定
        animations: 'disabled',
        // 全ページを撮影
        fullPage: true,
      });
    });
  }
});
